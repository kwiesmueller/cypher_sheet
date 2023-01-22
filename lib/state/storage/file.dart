import 'dart:developer';
import 'dart:io';

import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
// Fixnum is needed for int64 support: https://developers.google.com/protocol-buffers/docs/reference/dart-generated#int64-fields
// ignore: depend_on_referenced_packages
import 'package:fixnum/fixnum.dart';

Future<List<Future<CharacterMetadata>>> loadCharacterList() async {
  final charactersDirectory = await getCharactersDirectory();
  // Every character has its own sub-directory that contains the stored revisions
  // of that character
  final characterUUIDs = charactersDirectory
      .listSync(recursive: false)
      .map((dir) => p.basename(dir.path));

  final characters = characterUUIDs.map(
    (uuid) => readCharacterMetadata(uuid),
  );

  return characters.toList();
}

const String metadataFilename = "metadata";

Future<CharacterMetadata> readCharacterMetadata(String uuid) async {
  final characterDirectory = await getCharacterDirectory(uuid);
  final revisions = await readCharacterRevisions(uuid);
  final storageSize = await getCharacterStorageSizeBytes(uuid);

  final metadataFile = File(p.join(characterDirectory.path, metadataFilename));
  if (!metadataFile.existsSync()) {
    log("no metadata file found at ${metadataFile.path}");
    return CharacterMetadata(
        uuid: uuid, name: "<unknown>", revisions: revisions);
  }

  CharacterMetadata metadata =
      CharacterMetadata.fromBuffer(metadataFile.readAsBytesSync());
  metadata.revisions.clear();
  metadata.revisions.addAll(revisions);
  metadata.storageSize = storageSize;

  return metadata;
}

const uuid = Uuid();

void writeInitialCharacterRevision(Character character) async {
  writeCharacterRevision(character, 0);
}

Future<int> writeLatestCharacterRevision(Character character) async {
  final revisions = await readCharacterRevisions(character.uuid);

  late int newRevision;
  if (revisions.isNotEmpty) {
    final currentRevision = revisions.last;
    newRevision = currentRevision + 1;
  } else {
    // create a initial revision if none exists yet
    newRevision = 0;
  }

  writeCharacterRevision(character, newRevision);

  return newRevision;
}

void writeCharacterRevision(Character character, int revision) async {
  if (character.uuid.isEmpty) {
    character.uuid = uuid.v4();
  }

  final characterDirectory = await getCharacterDirectory(character.uuid);

  final metadata = File(p.join(characterDirectory.path, metadataFilename));
  log("writing metadata file ${metadata.path}");
  await metadata.writeAsBytes(CharacterMetadata(
    uuid: character.uuid,
    name: character.name,
    revisions: [],
    lastUpdated: Int64(DateTime.now().millisecondsSinceEpoch),
  ).writeToBuffer());

  final revisionFile =
      File(p.join(characterDirectory.path, revision.toString()));
  log("writing revision file ${revisionFile.path}");
  await revisionFile.writeAsBytes(character.writeToBuffer());
}

Future<Character> readLatestCharacterRevision(String uuid) async {
  final revisions = await readCharacterRevisions(uuid);
  return readCharacterRevision(uuid, revisions.last);
}

Future<String> readLatestCharacterRevisionRaw(String uuid) async {
  final revisions = await readCharacterRevisions(uuid);
  return readCharacterRevisionRaw(uuid, revisions.last);
}

Future<Character> readCharacterRevision(String uuid, int revisionID) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  final revision = File(p.join(characterDirectory.path, revisionID.toString()));

  return Character.fromBuffer(revision.readAsBytesSync());
}

Future<String> readCharacterRevisionRaw(String uuid, int revisionID) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  final revision = File(p.join(characterDirectory.path, revisionID.toString()));

  return revision.readAsBytesSync().toString();
}

Future<List<int>> readCharacterRevisions(String uuid) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  final uuids = characterDirectory
      .listSync(recursive: false)
      .map((file) => p.basename(file.path))
      .where((fileName) => fileName != metadataFilename)
      .map((revision) => int.tryParse(revision) ?? 0)
      .toList();
  uuids.sort(((a, b) => a.compareTo(b)));

  return uuids;
}

Future<int> getCharacterRevisionStorageSizeBytes(
    String uuid, int revision) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  return File(p.join(characterDirectory.path, revision.toString()))
      .lengthSync();
}

Future<int> getCharacterStorageSizeBytes(String uuid) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  int bytes = 0;
  characterDirectory.listSync(recursive: false).forEach((element) {
    if (element is File) {
      bytes += element.lengthSync();
    }
  });

  return bytes;
}

Future<Directory> getCharacterDirectory(String uuid) async {
  final charactersDirectory = await getCharactersDirectory();
  // We store each character in a directory named after its uuid
  return Directory(p.join(charactersDirectory.path, uuid))
      .create(recursive: true);
}

Future<Directory> getCharactersDirectory() async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  // We store all characters in a directory called characters
  return Directory(p.join(appDocDir.path, "characters"))
      .create(recursive: true);
}

void deleteCharacter(String uuid) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  log("deleting character $uuid");
  characterDirectory.deleteSync(recursive: true);
}

void deleteCharacterRevision(String uuid, int revision) async {
  final characterDirectory = await getCharacterDirectory(uuid);

  log("deleting character revision $uuid#${revision.toString()}");
  File(p.join(characterDirectory.path, revision.toString())).deleteSync();
}
