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
  $async.Future<$1.CharacterWritten> writeCharacterRevision($pb.ServerContext ctx, $1.WriteCharacter request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'WriteCharacterRevision': return $1.WriteCharacter();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'WriteCharacterRevision': return this.writeCharacterRevision(ctx, request as $1.WriteCharacter);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => CharactersServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => CharactersServiceBase$messageJson;
}

