///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use advancementDescriptor instead')
const Advancement$json = const {
  '1': 'Advancement',
  '2': const [
    const {'1': 'increaseCapabilities', '2': 0},
    const {'1': 'moveTowardPerfection', '2': 1},
    const {'1': 'extraEffort', '2': 2},
    const {'1': 'skillTraining', '2': 3},
    const {'1': 'other', '2': 4},
  ],
};

/// Descriptor for `Advancement`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List advancementDescriptor = $convert.base64Decode('CgtBZHZhbmNlbWVudBIYChRpbmNyZWFzZUNhcGFiaWxpdGllcxAAEhgKFG1vdmVUb3dhcmRQZXJmZWN0aW9uEAESDwoLZXh0cmFFZmZvcnQQAhIRCg1za2lsbFRyYWluaW5nEAMSCQoFb3RoZXIQBA==');
@$core.Deprecated('Use poolTypeDescriptor instead')
const PoolType$json = const {
  '1': 'PoolType',
  '2': const [
    const {'1': 'intellect', '2': 0},
    const {'1': 'speed', '2': 1},
    const {'1': 'might', '2': 2},
  ],
};

/// Descriptor for `PoolType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List poolTypeDescriptor = $convert.base64Decode('CghQb29sVHlwZRINCglpbnRlbGxlY3QQABIJCgVzcGVlZBABEgkKBW1pZ2h0EAI=');
@$core.Deprecated('Use recoverDescriptor instead')
const Recover$json = const {
  '1': 'Recover',
  '2': const [
    const {'1': 'one_action', '2': 0},
    const {'1': 'ten_minutes', '2': 1},
    const {'1': 'one_hour', '2': 2},
    const {'1': 'ten_hours', '2': 3},
  ],
};

/// Descriptor for `Recover`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recoverDescriptor = $convert.base64Decode('CgdSZWNvdmVyEg4KCm9uZV9hY3Rpb24QABIPCgt0ZW5fbWludXRlcxABEgwKCG9uZV9ob3VyEAISDQoJdGVuX2hvdXJzEAM=');
@$core.Deprecated('Use skillLevelDescriptor instead')
const SkillLevel$json = const {
  '1': 'SkillLevel',
  '2': const [
    const {'1': 'specialized', '2': 0},
    const {'1': 'trained', '2': 1},
    const {'1': 'inability', '2': 2},
  ],
};

/// Descriptor for `SkillLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List skillLevelDescriptor = $convert.base64Decode('CgpTa2lsbExldmVsEg8KC3NwZWNpYWxpemVkEAASCwoHdHJhaW5lZBABEg0KCWluYWJpbGl0eRAC');
@$core.Deprecated('Use cypherTypeDescriptor instead')
const CypherType$json = const {
  '1': 'CypherType',
  '2': const [
    const {'1': 'cypher', '2': 0},
    const {'1': 'artifact', '2': 1},
  ],
};

/// Descriptor for `CypherType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cypherTypeDescriptor = $convert.base64Decode('CgpDeXBoZXJUeXBlEgoKBmN5cGhlchAAEgwKCGFydGlmYWN0EAE=');
@$core.Deprecated('Use itemTypeDescriptor instead')
const ItemType$json = const {
  '1': 'ItemType',
  '2': const [
    const {'1': 'armor', '2': 0},
    const {'1': 'weapon', '2': 10},
    const {'1': 'clothing', '2': 20},
    const {'1': 'tool', '2': 30},
    const {'1': 'oddity', '2': 40},
    const {'1': 'material', '2': 50},
    const {'1': 'ammo', '2': 60},
    const {'1': 'plan', '2': 70},
    const {'1': 'others', '2': 900},
  ],
};

/// Descriptor for `ItemType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List itemTypeDescriptor = $convert.base64Decode('CghJdGVtVHlwZRIJCgVhcm1vchAAEgoKBndlYXBvbhAKEgwKCGNsb3RoaW5nEBQSCAoEdG9vbBAeEgoKBm9kZGl0eRAoEgwKCG1hdGVyaWFsEDISCAoEYW1tbxA8EggKBHBsYW4QRhILCgZvdGhlcnMQhAc=');
@$core.Deprecated('Use noteTypeDescriptor instead')
const NoteType$json = const {
  '1': 'NoteType',
  '2': const [
    const {'1': 'misc', '2': 0},
    const {'1': 'location', '2': 1},
    const {'1': 'character', '2': 2},
    const {'1': 'item', '2': 3},
    const {'1': 'quest', '2': 4},
  ],
};

/// Descriptor for `NoteType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List noteTypeDescriptor = $convert.base64Decode('CghOb3RlVHlwZRIICgRtaXNjEAASDAoIbG9jYXRpb24QARINCgljaGFyYWN0ZXIQAhIICgRpdGVtEAMSCQoFcXVlc3QQBA==');
@$core.Deprecated('Use characterMetadataDescriptor instead')
const CharacterMetadata$json = const {
  '1': 'CharacterMetadata',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lastUpdated', '3': 5, '4': 1, '5': 3, '10': 'lastUpdated'},
    const {'1': 'revisions', '3': 3, '4': 3, '5': 5, '10': 'revisions'},
    const {'1': 'storage_size', '3': 4, '4': 1, '5': 5, '10': 'storageSize'},
  ],
};

/// Descriptor for `CharacterMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterMetadataDescriptor = $convert.base64Decode('ChFDaGFyYWN0ZXJNZXRhZGF0YRISCgR1dWlkGAEgASgJUgR1dWlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLbGFzdFVwZGF0ZWQYBSABKANSC2xhc3RVcGRhdGVkEhwKCXJldmlzaW9ucxgDIAMoBVIJcmV2aXNpb25zEiEKDHN0b3JhZ2Vfc2l6ZRgEIAEoBVILc3RvcmFnZVNpemU=');
@$core.Deprecated('Use characterDescriptor instead')
const Character$json = const {
  '1': 'Character',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'descriptor', '3': 3, '4': 1, '5': 9, '10': 'descriptor'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'focus', '3': 5, '4': 1, '5': 9, '10': 'focus'},
    const {'1': 'color', '3': 17, '4': 1, '5': 11, '6': '.character.CharacterColor', '10': 'color'},
    const {'1': 'progress', '3': 6, '4': 1, '5': 11, '6': '.character.Progress', '10': 'progress'},
    const {'1': 'stats', '3': 7, '4': 1, '5': 11, '6': '.character.Stats', '10': 'stats'},
    const {'1': 'recovery', '3': 8, '4': 1, '5': 11, '6': '.character.Recovery', '10': 'recovery'},
    const {'1': 'damage', '3': 9, '4': 1, '5': 11, '6': '.character.Damage', '10': 'damage'},
    const {'1': 'skills', '3': 10, '4': 3, '5': 11, '6': '.character.Skill', '10': 'skills'},
    const {'1': 'abilities', '3': 11, '4': 3, '5': 11, '6': '.character.Ability', '10': 'abilities'},
    const {'1': 'cypher_limit', '3': 12, '4': 1, '5': 5, '10': 'cypherLimit'},
    const {'1': 'cyphers', '3': 13, '4': 3, '5': 11, '6': '.character.Cypher', '10': 'cyphers'},
    const {'1': 'artifacts', '3': 14, '4': 3, '5': 11, '6': '.character.Artifact', '10': 'artifacts'},
    const {'1': 'money', '3': 15, '4': 1, '5': 1, '10': 'money'},
    const {'1': 'inventories', '3': 16, '4': 3, '5': 11, '6': '.character.Inventory', '10': 'inventories'},
    const {'1': 'items', '3': 18, '4': 3, '5': 11, '6': '.character.Item', '10': 'items'},
    const {'1': 'notes', '3': 19, '4': 3, '5': 11, '6': '.character.Note', '10': 'notes'},
  ],
};

/// Descriptor for `Character`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterDescriptor = $convert.base64Decode('CglDaGFyYWN0ZXISEgoEdXVpZBgBIAEoCVIEdXVpZBISCgRuYW1lGAIgASgJUgRuYW1lEh4KCmRlc2NyaXB0b3IYAyABKAlSCmRlc2NyaXB0b3ISEgoEdHlwZRgEIAEoCVIEdHlwZRIUCgVmb2N1cxgFIAEoCVIFZm9jdXMSLwoFY29sb3IYESABKAsyGS5jaGFyYWN0ZXIuQ2hhcmFjdGVyQ29sb3JSBWNvbG9yEi8KCHByb2dyZXNzGAYgASgLMhMuY2hhcmFjdGVyLlByb2dyZXNzUghwcm9ncmVzcxImCgVzdGF0cxgHIAEoCzIQLmNoYXJhY3Rlci5TdGF0c1IFc3RhdHMSLwoIcmVjb3ZlcnkYCCABKAsyEy5jaGFyYWN0ZXIuUmVjb3ZlcnlSCHJlY292ZXJ5EikKBmRhbWFnZRgJIAEoCzIRLmNoYXJhY3Rlci5EYW1hZ2VSBmRhbWFnZRIoCgZza2lsbHMYCiADKAsyEC5jaGFyYWN0ZXIuU2tpbGxSBnNraWxscxIwCglhYmlsaXRpZXMYCyADKAsyEi5jaGFyYWN0ZXIuQWJpbGl0eVIJYWJpbGl0aWVzEiEKDGN5cGhlcl9saW1pdBgMIAEoBVILY3lwaGVyTGltaXQSKwoHY3lwaGVycxgNIAMoCzIRLmNoYXJhY3Rlci5DeXBoZXJSB2N5cGhlcnMSMQoJYXJ0aWZhY3RzGA4gAygLMhMuY2hhcmFjdGVyLkFydGlmYWN0UglhcnRpZmFjdHMSFAoFbW9uZXkYDyABKAFSBW1vbmV5EjYKC2ludmVudG9yaWVzGBAgAygLMhQuY2hhcmFjdGVyLkludmVudG9yeVILaW52ZW50b3JpZXMSJQoFaXRlbXMYEiADKAsyDy5jaGFyYWN0ZXIuSXRlbVIFaXRlbXMSJQoFbm90ZXMYEyADKAsyDy5jaGFyYWN0ZXIuTm90ZVIFbm90ZXM=');
@$core.Deprecated('Use characterColorDescriptor instead')
const CharacterColor$json = const {
  '1': 'CharacterColor',
  '2': const [
    const {'1': 'r', '3': 1, '4': 1, '5': 5, '10': 'r'},
    const {'1': 'g', '3': 2, '4': 1, '5': 5, '10': 'g'},
    const {'1': 'b', '3': 3, '4': 1, '5': 5, '10': 'b'},
  ],
};

/// Descriptor for `CharacterColor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterColorDescriptor = $convert.base64Decode('Cg5DaGFyYWN0ZXJDb2xvchIMCgFyGAEgASgFUgFyEgwKAWcYAiABKAVSAWcSDAoBYhgDIAEoBVIBYg==');
@$core.Deprecated('Use advancementInfoDescriptor instead')
const AdvancementInfo$json = const {
  '1': 'AdvancementInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `AdvancementInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List advancementInfoDescriptor = $convert.base64Decode('Cg9BZHZhbmNlbWVudEluZm8SEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24=');
@$core.Deprecated('Use advancementsDescriptor instead')
const Advancements$json = const {
  '1': 'Advancements',
  '2': const [
    const {'1': 'increaseCapabilities', '3': 1, '4': 1, '5': 8, '10': 'increaseCapabilities'},
    const {'1': 'moveTowardPerfection', '3': 2, '4': 1, '5': 8, '10': 'moveTowardPerfection'},
    const {'1': 'extraEffort', '3': 3, '4': 1, '5': 8, '10': 'extraEffort'},
    const {'1': 'skillTraining', '3': 4, '4': 1, '5': 8, '10': 'skillTraining'},
    const {'1': 'other', '3': 5, '4': 1, '5': 8, '10': 'other'},
  ],
};

/// Descriptor for `Advancements`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List advancementsDescriptor = $convert.base64Decode('CgxBZHZhbmNlbWVudHMSMgoUaW5jcmVhc2VDYXBhYmlsaXRpZXMYASABKAhSFGluY3JlYXNlQ2FwYWJpbGl0aWVzEjIKFG1vdmVUb3dhcmRQZXJmZWN0aW9uGAIgASgIUhRtb3ZlVG93YXJkUGVyZmVjdGlvbhIgCgtleHRyYUVmZm9ydBgDIAEoCFILZXh0cmFFZmZvcnQSJAoNc2tpbGxUcmFpbmluZxgEIAEoCFINc2tpbGxUcmFpbmluZxIUCgVvdGhlchgFIAEoCFIFb3RoZXI=');
@$core.Deprecated('Use progressDescriptor instead')
const Progress$json = const {
  '1': 'Progress',
  '2': const [
    const {'1': 'tier', '3': 1, '4': 1, '5': 5, '10': 'tier'},
    const {'1': 'free_xp', '3': 2, '4': 1, '5': 5, '10': 'freeXp'},
    const {'1': 'total_xp', '3': 3, '4': 1, '5': 5, '10': 'totalXp'},
    const {'1': 'max_effort', '3': 4, '4': 1, '5': 5, '10': 'maxEffort'},
    const {'1': 'advancements', '3': 5, '4': 1, '5': 11, '6': '.character.Advancements', '10': 'advancements'},
  ],
};

/// Descriptor for `Progress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressDescriptor = $convert.base64Decode('CghQcm9ncmVzcxISCgR0aWVyGAEgASgFUgR0aWVyEhcKB2ZyZWVfeHAYAiABKAVSBmZyZWVYcBIZCgh0b3RhbF94cBgDIAEoBVIHdG90YWxYcBIdCgptYXhfZWZmb3J0GAQgASgFUgltYXhFZmZvcnQSOwoMYWR2YW5jZW1lbnRzGAUgASgLMhcuY2hhcmFjdGVyLkFkdmFuY2VtZW50c1IMYWR2YW5jZW1lbnRz');
@$core.Deprecated('Use statDescriptor instead')
const Stat$json = const {
  '1': 'Stat',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.character.PoolType', '10': 'type'},
    const {'1': 'cap', '3': 2, '4': 1, '5': 5, '10': 'cap'},
    const {'1': 'pool', '3': 3, '4': 1, '5': 5, '10': 'pool'},
    const {'1': 'edge', '3': 4, '4': 1, '5': 5, '10': 'edge'},
  ],
};

/// Descriptor for `Stat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statDescriptor = $convert.base64Decode('CgRTdGF0EicKBHR5cGUYASABKA4yEy5jaGFyYWN0ZXIuUG9vbFR5cGVSBHR5cGUSEAoDY2FwGAIgASgFUgNjYXASEgoEcG9vbBgDIAEoBVIEcG9vbBISCgRlZGdlGAQgASgFUgRlZGdl');
@$core.Deprecated('Use statsDescriptor instead')
const Stats$json = const {
  '1': 'Stats',
  '2': const [
    const {'1': 'intellect', '3': 1, '4': 1, '5': 11, '6': '.character.Stat', '10': 'intellect'},
    const {'1': 'speed', '3': 2, '4': 1, '5': 11, '6': '.character.Stat', '10': 'speed'},
    const {'1': 'might', '3': 3, '4': 1, '5': 11, '6': '.character.Stat', '10': 'might'},
  ],
};

/// Descriptor for `Stats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statsDescriptor = $convert.base64Decode('CgVTdGF0cxItCglpbnRlbGxlY3QYASABKAsyDy5jaGFyYWN0ZXIuU3RhdFIJaW50ZWxsZWN0EiUKBXNwZWVkGAIgASgLMg8uY2hhcmFjdGVyLlN0YXRSBXNwZWVkEiUKBW1pZ2h0GAMgASgLMg8uY2hhcmFjdGVyLlN0YXRSBW1pZ2h0');
@$core.Deprecated('Use recoveryDescriptor instead')
const Recovery$json = const {
  '1': 'Recovery',
  '2': const [
    const {'1': 'bonus', '3': 1, '4': 1, '5': 5, '10': 'bonus'},
    const {'1': 'one_action', '3': 2, '4': 1, '5': 8, '10': 'oneAction'},
    const {'1': 'ten_minutes', '3': 3, '4': 1, '5': 8, '10': 'tenMinutes'},
    const {'1': 'one_hour', '3': 4, '4': 1, '5': 8, '10': 'oneHour'},
    const {'1': 'ten_hours', '3': 5, '4': 1, '5': 8, '10': 'tenHours'},
  ],
};

/// Descriptor for `Recovery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recoveryDescriptor = $convert.base64Decode('CghSZWNvdmVyeRIUCgVib251cxgBIAEoBVIFYm9udXMSHQoKb25lX2FjdGlvbhgCIAEoCFIJb25lQWN0aW9uEh8KC3Rlbl9taW51dGVzGAMgASgIUgp0ZW5NaW51dGVzEhkKCG9uZV9ob3VyGAQgASgIUgdvbmVIb3VyEhsKCXRlbl9ob3VycxgFIAEoCFIIdGVuSG91cnM=');
@$core.Deprecated('Use damageDescriptor instead')
const Damage$json = const {
  '1': 'Damage',
  '2': const [
    const {'1': 'impaired', '3': 1, '4': 1, '5': 8, '10': 'impaired'},
    const {'1': 'debilitated', '3': 2, '4': 1, '5': 8, '10': 'debilitated'},
  ],
};

/// Descriptor for `Damage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List damageDescriptor = $convert.base64Decode('CgZEYW1hZ2USGgoIaW1wYWlyZWQYASABKAhSCGltcGFpcmVkEiAKC2RlYmlsaXRhdGVkGAIgASgIUgtkZWJpbGl0YXRlZA==');
@$core.Deprecated('Use skillDescriptor instead')
const Skill$json = const {
  '1': 'Skill',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.character.PoolType', '10': 'type'},
    const {'1': 'level', '3': 5, '4': 1, '5': 14, '6': '.character.SkillLevel', '10': 'level'},
  ],
};

/// Descriptor for `Skill`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skillDescriptor = $convert.base64Decode('CgVTa2lsbBISCgR1dWlkGAEgASgJUgR1dWlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEicKBHR5cGUYBCABKA4yEy5jaGFyYWN0ZXIuUG9vbFR5cGVSBHR5cGUSKwoFbGV2ZWwYBSABKA4yFS5jaGFyYWN0ZXIuU2tpbGxMZXZlbFIFbGV2ZWw=');
@$core.Deprecated('Use abilityDescriptor instead')
const Ability$json = const {
  '1': 'Ability',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'cost', '3': 3, '4': 1, '5': 9, '10': 'cost'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.character.PoolType', '10': 'type'},
    const {'1': 'enabler', '3': 5, '4': 1, '5': 8, '10': 'enabler'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'short_description', '3': 7, '4': 1, '5': 9, '10': 'shortDescription'},
  ],
};

/// Descriptor for `Ability`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abilityDescriptor = $convert.base64Decode('CgdBYmlsaXR5EhIKBHV1aWQYASABKAlSBHV1aWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgRjb3N0GAMgASgJUgRjb3N0EicKBHR5cGUYBCABKA4yEy5jaGFyYWN0ZXIuUG9vbFR5cGVSBHR5cGUSGAoHZW5hYmxlchgFIAEoCFIHZW5hYmxlchIgCgtkZXNjcmlwdGlvbhgGIAEoCVILZGVzY3JpcHRpb24SKwoRc2hvcnRfZGVzY3JpcHRpb24YByABKAlSEHNob3J0RGVzY3JpcHRpb24=');
@$core.Deprecated('Use cypherDescriptor instead')
const Cypher$json = const {
  '1': 'Cypher',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'level', '3': 3, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'short_description', '3': 4, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'effect', '3': 5, '4': 1, '5': 9, '10': 'effect'},
    const {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
    const {'1': 'depletion', '3': 7, '4': 1, '5': 9, '10': 'depletion'},
    const {'1': 'internal', '3': 8, '4': 1, '5': 9, '10': 'internal'},
    const {'1': 'wearable', '3': 9, '4': 1, '5': 9, '10': 'wearable'},
    const {'1': 'usable', '3': 10, '4': 1, '5': 9, '10': 'usable'},
  ],
};

/// Descriptor for `Cypher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cypherDescriptor = $convert.base64Decode('CgZDeXBoZXISEgoEdXVpZBgBIAEoCVIEdXVpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBWxldmVsGAMgASgJUgVsZXZlbBIrChFzaG9ydF9kZXNjcmlwdGlvbhgEIAEoCVIQc2hvcnREZXNjcmlwdGlvbhIWCgZlZmZlY3QYBSABKAlSBmVmZmVjdBIWCgZhY3RpdmUYBiABKAhSBmFjdGl2ZRIcCglkZXBsZXRpb24YByABKAlSCWRlcGxldGlvbhIaCghpbnRlcm5hbBgIIAEoCVIIaW50ZXJuYWwSGgoId2VhcmFibGUYCSABKAlSCHdlYXJhYmxlEhYKBnVzYWJsZRgKIAEoCVIGdXNhYmxl');
@$core.Deprecated('Use artifactDescriptor instead')
const Artifact$json = const {
  '1': 'Artifact',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'level', '3': 3, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'short_description', '3': 4, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'effect', '3': 5, '4': 1, '5': 9, '10': 'effect'},
    const {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
    const {'1': 'depletion', '3': 7, '4': 1, '5': 9, '10': 'depletion'},
    const {'1': 'form', '3': 8, '4': 1, '5': 9, '10': 'form'},
  ],
};

/// Descriptor for `Artifact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artifactDescriptor = $convert.base64Decode('CghBcnRpZmFjdBISCgR1dWlkGAEgASgJUgR1dWlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFbGV2ZWwYAyABKAlSBWxldmVsEisKEXNob3J0X2Rlc2NyaXB0aW9uGAQgASgJUhBzaG9ydERlc2NyaXB0aW9uEhYKBmVmZmVjdBgFIAEoCVIGZWZmZWN0EhYKBmFjdGl2ZRgGIAEoCFIGYWN0aXZlEhwKCWRlcGxldGlvbhgHIAEoCVIJZGVwbGV0aW9uEhIKBGZvcm0YCCABKAlSBGZvcm0=');
@$core.Deprecated('Use inventoryDescriptor instead')
const Inventory$json = const {
  '1': 'Inventory',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'order', '3': 4, '4': 1, '5': 5, '10': 'order'},
  ],
};

/// Descriptor for `Inventory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryDescriptor = $convert.base64Decode('CglJbnZlbnRvcnkSEgoEdXVpZBgBIAEoCVIEdXVpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBW9yZGVyGAQgASgFUgVvcmRlcg==');
@$core.Deprecated('Use itemPathDescriptor instead')
const ItemPath$json = const {
  '1': 'ItemPath',
  '2': const [
    const {'1': 'inventory', '3': 1, '4': 1, '5': 9, '10': 'inventory'},
    const {'1': 'parent', '3': 2, '4': 1, '5': 9, '10': 'parent'},
    const {'1': 'self', '3': 3, '4': 1, '5': 9, '10': 'self'},
  ],
};

/// Descriptor for `ItemPath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemPathDescriptor = $convert.base64Decode('CghJdGVtUGF0aBIcCglpbnZlbnRvcnkYASABKAlSCWludmVudG9yeRIWCgZwYXJlbnQYAiABKAlSBnBhcmVudBISCgRzZWxmGAMgASgJUgRzZWxm');
@$core.Deprecated('Use itemDescriptor instead')
const Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 11, '6': '.character.ItemPath', '10': 'path'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'short_description', '3': 4, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'types', '3': 5, '4': 3, '5': 14, '6': '.character.ItemType', '10': 'types'},
    const {'1': 'amount', '3': 6, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'value', '3': 8, '4': 1, '5': 1, '10': 'value'},
    const {'1': 'sub_item_type', '3': 7, '4': 1, '5': 14, '6': '.character.ItemType', '9': 0, '10': 'subItemType', '17': true},
    const {'1': 'armor', '3': 9, '4': 1, '5': 5, '9': 1, '10': 'armor', '17': true},
  ],
  '8': const [
    const {'1': '_sub_item_type'},
    const {'1': '_armor'},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode('CgRJdGVtEicKBHBhdGgYASABKAsyEy5jaGFyYWN0ZXIuSXRlbVBhdGhSBHBhdGgSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SKwoRc2hvcnRfZGVzY3JpcHRpb24YBCABKAlSEHNob3J0RGVzY3JpcHRpb24SKQoFdHlwZXMYBSADKA4yEy5jaGFyYWN0ZXIuSXRlbVR5cGVSBXR5cGVzEhYKBmFtb3VudBgGIAEoAVIGYW1vdW50EhQKBXZhbHVlGAggASgBUgV2YWx1ZRI8Cg1zdWJfaXRlbV90eXBlGAcgASgOMhMuY2hhcmFjdGVyLkl0ZW1UeXBlSABSC3N1Ykl0ZW1UeXBliAEBEhkKBWFybW9yGAkgASgFSAFSBWFybW9yiAEBQhAKDl9zdWJfaXRlbV90eXBlQggKBl9hcm1vcg==');
@$core.Deprecated('Use noteDescriptor instead')
const Note$json = const {
  '1': 'Note',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.character.NoteType', '10': 'type'},
    const {'1': 'shortDescription', '3': 4, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'text', '3': 5, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Note`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteDescriptor = $convert.base64Decode('CgROb3RlEhIKBHV1aWQYASABKAlSBHV1aWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEicKBHR5cGUYAyABKA4yEy5jaGFyYWN0ZXIuTm90ZVR5cGVSBHR5cGUSKgoQc2hvcnREZXNjcmlwdGlvbhgEIAEoCVIQc2hvcnREZXNjcmlwdGlvbhISCgR0ZXh0GAUgASgJUgR0ZXh0');
@$core.Deprecated('Use sharedObjectDescriptor instead')
const SharedObject$json = const {
  '1': 'SharedObject',
  '2': const [
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'character', '3': 10, '4': 1, '5': 11, '6': '.character.Character', '9': 0, '10': 'character'},
    const {'1': 'skill', '3': 20, '4': 1, '5': 11, '6': '.character.Skill', '9': 0, '10': 'skill'},
    const {'1': 'ability', '3': 30, '4': 1, '5': 11, '6': '.character.Ability', '9': 0, '10': 'ability'},
    const {'1': 'cypher', '3': 40, '4': 1, '5': 11, '6': '.character.Cypher', '9': 0, '10': 'cypher'},
    const {'1': 'artifact', '3': 50, '4': 1, '5': 11, '6': '.character.Artifact', '9': 0, '10': 'artifact'},
    const {'1': 'item', '3': 60, '4': 1, '5': 11, '6': '.character.Item', '9': 0, '10': 'item'},
    const {'1': 'note', '3': 70, '4': 1, '5': 11, '6': '.character.Note', '9': 0, '10': 'note'},
  ],
  '8': const [
    const {'1': 'object'},
  ],
};

/// Descriptor for `SharedObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sharedObjectDescriptor = $convert.base64Decode('CgxTaGFyZWRPYmplY3QSEgoEdXVpZBgCIAEoCVIEdXVpZBISCgRuYW1lGAMgASgJUgRuYW1lEjQKCWNoYXJhY3RlchgKIAEoCzIULmNoYXJhY3Rlci5DaGFyYWN0ZXJIAFIJY2hhcmFjdGVyEigKBXNraWxsGBQgASgLMhAuY2hhcmFjdGVyLlNraWxsSABSBXNraWxsEi4KB2FiaWxpdHkYHiABKAsyEi5jaGFyYWN0ZXIuQWJpbGl0eUgAUgdhYmlsaXR5EisKBmN5cGhlchgoIAEoCzIRLmNoYXJhY3Rlci5DeXBoZXJIAFIGY3lwaGVyEjEKCGFydGlmYWN0GDIgASgLMhMuY2hhcmFjdGVyLkFydGlmYWN0SABSCGFydGlmYWN0EiUKBGl0ZW0YPCABKAsyDy5jaGFyYWN0ZXIuSXRlbUgAUgRpdGVtEiUKBG5vdGUYRiABKAsyDy5jaGFyYWN0ZXIuTm90ZUgAUgRub3RlQggKBm9iamVjdA==');
