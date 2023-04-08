///
//  Generated code. Do not modify.
//  source: characters.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'characters.pb.dart' as $1;
import 'characters.pbjson.dart';

export 'characters.pb.dart';

abstract class CharactersServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CharacterCreated> create($pb.ServerContext ctx, $1.CreateCharacter request);
  $async.Future<$1.RevisionWritten> writeCharacterRevision($pb.ServerContext ctx, $1.WriteRevision request);
  $async.Future<$1.RevisionRead> readCharacterRevision($pb.ServerContext ctx, $1.ReadRevision request);
  $async.Future<$1.RevisionRead> readLatestCharacterRevision($pb.ServerContext ctx, $1.ReadLatestRevision request);
  $async.Future<$1.CharacterDeleted> delete($pb.ServerContext ctx, $1.DeleteCharacter request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Create': return $1.CreateCharacter();
      case 'WriteCharacterRevision': return $1.WriteRevision();
      case 'ReadCharacterRevision': return $1.ReadRevision();
      case 'ReadLatestCharacterRevision': return $1.ReadLatestRevision();
      case 'Delete': return $1.DeleteCharacter();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Create': return this.create(ctx, request as $1.CreateCharacter);
      case 'WriteCharacterRevision': return this.writeCharacterRevision(ctx, request as $1.WriteRevision);
      case 'ReadCharacterRevision': return this.readCharacterRevision(ctx, request as $1.ReadRevision);
      case 'ReadLatestCharacterRevision': return this.readLatestCharacterRevision(ctx, request as $1.ReadLatestRevision);
      case 'Delete': return this.delete(ctx, request as $1.DeleteCharacter);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => CharactersServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => CharactersServiceBase$messageJson;
}

