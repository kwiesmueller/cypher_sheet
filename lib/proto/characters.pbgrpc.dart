///
//  Generated code. Do not modify.
//  source: characters.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'characters.pb.dart' as $0;
export 'characters.pb.dart';

class CharactersClient extends $grpc.Client {
  static final _$writeCharacterRevision =
      $grpc.ClientMethod<$0.WriteCharacter, $0.CharacterWritten>(
          '/characters.Characters/WriteCharacterRevision',
          ($0.WriteCharacter value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CharacterWritten.fromBuffer(value));

  CharactersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CharacterWritten> writeCharacterRevision(
      $0.WriteCharacter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeCharacterRevision, request,
        options: options);
  }
}

abstract class CharactersServiceBase extends $grpc.Service {
  $core.String get $name => 'characters.Characters';

  CharactersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.WriteCharacter, $0.CharacterWritten>(
        'WriteCharacterRevision',
        writeCharacterRevision_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WriteCharacter.fromBuffer(value),
        ($0.CharacterWritten value) => value.writeToBuffer()));
  }

  $async.Future<$0.CharacterWritten> writeCharacterRevision_Pre(
      $grpc.ServiceCall call, $async.Future<$0.WriteCharacter> request) async {
    return writeCharacterRevision(call, await request);
  }

  $async.Future<$0.CharacterWritten> writeCharacterRevision(
      $grpc.ServiceCall call, $0.WriteCharacter request);
}
