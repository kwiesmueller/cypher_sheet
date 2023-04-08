import 'dart:io';

import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/import.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/import.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/import.dart';
import 'package:cypher_sheet/views/dialogs/object/item/import.dart';
import 'package:cypher_sheet/views/dialogs/object/note/import.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/import.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

const defaultMimeType = "application/cypher-sheet-object";
const defaultFileExtension = "cso";

extension Shareable on SharedObject {
  String mimeType() {
    return defaultMimeType;
  }

  String printableType() {
    final typeName = whichObject().name;
    if (typeName.isEmpty) {
      return "<unknown>";
    }
    return typeName[0].toUpperCase() + typeName.substring(1);
  }

  Future<XFile> toFile() async {
    return _asTempFile();
  }

  Future<XFile> _asTempFile() async {
    final raw = writeToBuffer();
    final String tempPath = (await getTemporaryDirectory()).path;

    // Normalize the name to avoid issues with the path on certain platforms.
    final fileName = name.replaceAll(RegExp("[^A-Za-z0-9]"), "_");

    final path = '$tempPath/$fileName.$defaultFileExtension';
    final tempFile = File(path);

    await tempFile.writeAsBytes(raw);

    // Windows doesn't seem to like our mime type right now, needs further
    // investigation but let's just ignore it there.
    final String fileMimeType = Platform.isWindows ? "text/plain" : mimeType();

    return XFile.fromData(
      raw,
      name: name,
      mimeType: fileMimeType,
      path: path,
    );
  }
}

extension Importable on SharedObject {
  Widget importDialog({
    Function()? onCancel,
    Function()? onSuccess,
  }) {
    switch (whichObject()) {
      case SharedObject_Object.cypher:
        return ImportCypher(
          cypher,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      case SharedObject_Object.artifact:
        return ImportArtifact(
          artifact,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      case SharedObject_Object.item:
        return ImportItem(
          item,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      case SharedObject_Object.ability:
        return ImportAbility(
          ability,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      case SharedObject_Object.skill:
        return ImportSkill(
          skill,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      case SharedObject_Object.note:
        return ImportNote(
          note,
          onCancel: onCancel,
          onSuccess: onSuccess,
        );
      default:
        return AppDialog(
          child: AppText("Can't import ${printableType()}, yet."),
        );
    }
  }
}
