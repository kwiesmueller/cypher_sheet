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
  static final _$create =
      $grpc.ClientMethod<$0.CreateCharacter, $0.CharacterCreated>(
          '/characters.Characters/Create',
          ($0.CreateCharacter value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CharacterCreated.fromBuffer(value));
  static final _$writeCharacterRevision =
      $grpc.ClientMethod<$0.WriteRevision, $0.RevisionWritten>(
          '/characters.Characters/WriteCharacterRevision',
          ($0.WriteRevision value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RevisionWritten.fromBuffer(value));
  static final _$readCharacterRevision =
      $grpc.ClientMethod<$0.ReadRevision, $0.RevisionRead>(
          '/characters.Characters/ReadCharacterRevision',
          ($0.ReadRevision value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RevisionRead.fromBuffer(value));
  static final _$readLatestCharacterRevision =
      $grpc.ClientMethod<$0.ReadLatestRevision, $0.RevisionRead>(
          '/characters.Characters/ReadLatestCharacterRevision',
          ($0.ReadLatestRevision value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RevisionRead.fromBuffer(value));
  static final _$delete =
      $grpc.ClientMethod<$0.DeleteCharacter, $0.CharacterDeleted>(
          '/characters.Characters/Delete',
          ($0.DeleteCharacter value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CharacterDeleted.fromBuffer(value));

  CharactersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CharacterCreated> create($0.CreateCharacter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.RevisionWritten> writeCharacterRevision(
      $0.WriteRevision request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeCharacterRevision, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RevisionRead> readCharacterRevision(
      $0.ReadRevision request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readCharacterRevision, request, options: options);
  }

  $grpc.ResponseFuture<$0.RevisionRead> readLatestCharacterRevision(
      $0.ReadLatestRevision request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readLatestCharacterRevision, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CharacterDeleted> delete($0.DeleteCharacter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

abstract class CharactersServiceBase extends $grpc.Service {
  $core.String get $name => 'characters.Characters';

  CharactersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateCharacter, $0.CharacterCreated>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateCharacter.fromBuffer(value),
        ($0.CharacterCreated value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WriteRevision, $0.RevisionWritten>(
        'WriteCharacterRevision',
        writeCharacterRevision_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WriteRevision.fromBuffer(value),
        ($0.RevisionWritten value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadRevision, $0.RevisionRead>(
        'ReadCharacterRevision',
        readCharacterRevision_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadRevision.fromBuffer(value),
        ($0.RevisionRead value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadLatestRevision, $0.RevisionRead>(
        'ReadLatestCharacterRevision',
        readLatestCharacterRevision_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReadLatestRevision.fromBuffer(value),
        ($0.RevisionRead value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCharacter, $0.CharacterDeleted>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCharacter.fromBuffer(value),
        ($0.CharacterDeleted value) => value.writeToBuffer()));
  }

  $async.Future<$0.CharacterCreated> create_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateCharacter> request) async {
    return create(call, await request);
  }

  $async.Future<$0.RevisionWritten> writeCharacterRevision_Pre(
      $grpc.ServiceCall call, $async.Future<$0.WriteRevision> request) async {
    return writeCharacterRevision(call, await request);
  }

  $async.Future<$0.RevisionRead> readCharacterRevision_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ReadRevision> request) async {
    return readCharacterRevision(call, await request);
  }

  $async.Future<$0.RevisionRead> readLatestCharacterRevision_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ReadLatestRevision> request) async {
    return readLatestCharacterRevision(call, await request);
  }

  $async.Future<$0.CharacterDeleted> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteCharacter> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.CharacterCreated> create(
      $grpc.ServiceCall call, $0.CreateCharacter request);
  $async.Future<$0.RevisionWritten> writeCharacterRevision(
      $grpc.ServiceCall call, $0.WriteRevision request);
  $async.Future<$0.RevisionRead> readCharacterRevision(
      $grpc.ServiceCall call, $0.ReadRevision request);
  $async.Future<$0.RevisionRead> readLatestCharacterRevision(
      $grpc.ServiceCall call, $0.ReadLatestRevision request);
  $async.Future<$0.CharacterDeleted> delete(
      $grpc.ServiceCall call, $0.DeleteCharacter request);
}
