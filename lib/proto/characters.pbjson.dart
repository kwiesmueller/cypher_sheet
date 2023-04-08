///
//  Generated code. Do not modify.
//  source: characters.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createCharacterDescriptor instead')
const CreateCharacter$json = const {
  '1': 'CreateCharacter',
};

/// Descriptor for `CreateCharacter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCharacterDescriptor = $convert.base64Decode('Cg9DcmVhdGVDaGFyYWN0ZXI=');
@$core.Deprecated('Use characterCreatedDescriptor instead')
const CharacterCreated$json = const {
  '1': 'CharacterCreated',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `CharacterCreated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterCreatedDescriptor = $convert.base64Decode('ChBDaGFyYWN0ZXJDcmVhdGVkEhIKBHV1aWQYASABKAlSBHV1aWQ=');
@$core.Deprecated('Use writeRevisionDescriptor instead')
const WriteRevision$json = const {
  '1': 'WriteRevision',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'character', '3': 2, '4': 1, '5': 11, '6': '.character.Character', '10': 'character'},
    const {'1': 'revision', '3': 3, '4': 1, '5': 4, '10': 'revision'},
  ],
};

/// Descriptor for `WriteRevision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeRevisionDescriptor = $convert.base64Decode('Cg1Xcml0ZVJldmlzaW9uEhIKBHV1aWQYASABKAlSBHV1aWQSMgoJY2hhcmFjdGVyGAIgASgLMhQuY2hhcmFjdGVyLkNoYXJhY3RlclIJY2hhcmFjdGVyEhoKCHJldmlzaW9uGAMgASgEUghyZXZpc2lvbg==');
@$core.Deprecated('Use revisionWrittenDescriptor instead')
const RevisionWritten$json = const {
  '1': 'RevisionWritten',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '10': 'revision'},
  ],
};

/// Descriptor for `RevisionWritten`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revisionWrittenDescriptor = $convert.base64Decode('Cg9SZXZpc2lvbldyaXR0ZW4SEgoEdXVpZBgBIAEoCVIEdXVpZBIaCghyZXZpc2lvbhgCIAEoBFIIcmV2aXNpb24=');
@$core.Deprecated('Use readRevisionDescriptor instead')
const ReadRevision$json = const {
  '1': 'ReadRevision',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '10': 'revision'},
  ],
};

/// Descriptor for `ReadRevision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRevisionDescriptor = $convert.base64Decode('CgxSZWFkUmV2aXNpb24SEgoEdXVpZBgBIAEoCVIEdXVpZBIaCghyZXZpc2lvbhgCIAEoBFIIcmV2aXNpb24=');
@$core.Deprecated('Use revisionReadDescriptor instead')
const RevisionRead$json = const {
  '1': 'RevisionRead',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '10': 'revision'},
    const {'1': 'character', '3': 3, '4': 1, '5': 11, '6': '.character.Character', '10': 'character'},
  ],
};

/// Descriptor for `RevisionRead`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revisionReadDescriptor = $convert.base64Decode('CgxSZXZpc2lvblJlYWQSEgoEdXVpZBgBIAEoCVIEdXVpZBIaCghyZXZpc2lvbhgCIAEoBFIIcmV2aXNpb24SMgoJY2hhcmFjdGVyGAMgASgLMhQuY2hhcmFjdGVyLkNoYXJhY3RlclIJY2hhcmFjdGVy');
@$core.Deprecated('Use readLatestRevisionDescriptor instead')
const ReadLatestRevision$json = const {
  '1': 'ReadLatestRevision',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `ReadLatestRevision`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readLatestRevisionDescriptor = $convert.base64Decode('ChJSZWFkTGF0ZXN0UmV2aXNpb24SEgoEdXVpZBgBIAEoCVIEdXVpZA==');
@$core.Deprecated('Use deleteCharacterDescriptor instead')
const DeleteCharacter$json = const {
  '1': 'DeleteCharacter',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `DeleteCharacter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCharacterDescriptor = $convert.base64Decode('Cg9EZWxldGVDaGFyYWN0ZXISEgoEdXVpZBgBIAEoCVIEdXVpZA==');
@$core.Deprecated('Use characterDeletedDescriptor instead')
const CharacterDeleted$json = const {
  '1': 'CharacterDeleted',
};

/// Descriptor for `CharacterDeleted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterDeletedDescriptor = $convert.base64Decode('ChBDaGFyYWN0ZXJEZWxldGVk');
