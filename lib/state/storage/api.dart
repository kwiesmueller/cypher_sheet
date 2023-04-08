import 'dart:developer';

import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/proto/characters.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<void> writeCharacterRevisionToAPI(Character character) async {
  final channel = ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  try {
    final stub = CharactersClient(channel);
    var response =
        await stub.writeCharacterRevision(WriteRevision(character: character));
    log('Uploaded character: $response');
  } catch (e) {
    log('Caught error: $e');
  }
  await channel.shutdown();
}
