///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Advancement extends $pb.ProtobufEnum {
  static const Advancement increaseCapabilities = Advancement._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'increaseCapabilities');
  static const Advancement moveTowardPerfection = Advancement._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'moveTowardPerfection');
  static const Advancement extraEffort = Advancement._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'extraEffort');
  static const Advancement skillTraining = Advancement._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'skillTraining');
  static const Advancement other = Advancement._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'other');

  static const $core.List<Advancement> values = <Advancement> [
    increaseCapabilities,
    moveTowardPerfection,
    extraEffort,
    skillTraining,
    other,
  ];

  static final $core.Map<$core.int, Advancement> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Advancement? valueOf($core.int value) => _byValue[value];

  const Advancement._($core.int v, $core.String n) : super(v, n);
}

class PoolType extends $pb.ProtobufEnum {
  static const PoolType intellect = PoolType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'intellect');
  static const PoolType speed = PoolType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'speed');
  static const PoolType might = PoolType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'might');

  static const $core.List<PoolType> values = <PoolType> [
    intellect,
    speed,
    might,
  ];

  static final $core.Map<$core.int, PoolType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PoolType? valueOf($core.int value) => _byValue[value];

  const PoolType._($core.int v, $core.String n) : super(v, n);
}

class Recover extends $pb.ProtobufEnum {
  static const Recover one_action = Recover._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'one_action');
  static const Recover ten_minutes = Recover._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ten_minutes');
  static const Recover one_hour = Recover._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'one_hour');
  static const Recover ten_hours = Recover._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ten_hours');

  static const $core.List<Recover> values = <Recover> [
    one_action,
    ten_minutes,
    one_hour,
    ten_hours,
  ];

  static final $core.Map<$core.int, Recover> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Recover? valueOf($core.int value) => _byValue[value];

  const Recover._($core.int v, $core.String n) : super(v, n);
}

class SkillLevel extends $pb.ProtobufEnum {
  static const SkillLevel specialized = SkillLevel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'specialized');
  static const SkillLevel trained = SkillLevel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'trained');
  static const SkillLevel inability = SkillLevel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'inability');

  static const $core.List<SkillLevel> values = <SkillLevel> [
    specialized,
    trained,
    inability,
  ];

  static final $core.Map<$core.int, SkillLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SkillLevel? valueOf($core.int value) => _byValue[value];

  const SkillLevel._($core.int v, $core.String n) : super(v, n);
}

class CypherType extends $pb.ProtobufEnum {
  static const CypherType cypher = CypherType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cypher');
  static const CypherType artifact = CypherType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'artifact');

  static const $core.List<CypherType> values = <CypherType> [
    cypher,
    artifact,
  ];

  static final $core.Map<$core.int, CypherType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CypherType? valueOf($core.int value) => _byValue[value];

  const CypherType._($core.int v, $core.String n) : super(v, n);
}

class ItemType extends $pb.ProtobufEnum {
  static const ItemType armor = ItemType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'armor');
  static const ItemType weapon = ItemType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'weapon');
  static const ItemType clothing = ItemType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'clothing');
  static const ItemType tool = ItemType._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tool');
  static const ItemType oddity = ItemType._(40, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'oddity');
  static const ItemType material = ItemType._(50, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'material');
  static const ItemType ammo = ItemType._(60, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ammo');
  static const ItemType plan = ItemType._(70, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'plan');
  static const ItemType others = ItemType._(900, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'others');

  static const $core.List<ItemType> values = <ItemType> [
    armor,
    weapon,
    clothing,
    tool,
    oddity,
    material,
    ammo,
    plan,
    others,
  ];

  static final $core.Map<$core.int, ItemType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ItemType? valueOf($core.int value) => _byValue[value];

  const ItemType._($core.int v, $core.String n) : super(v, n);
}

class NoteType extends $pb.ProtobufEnum {
  static const NoteType misc = NoteType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'misc');
  static const NoteType location = NoteType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'location');
  static const NoteType character = NoteType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'character');
  static const NoteType item = NoteType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'item');
  static const NoteType quest = NoteType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'quest');

  static const $core.List<NoteType> values = <NoteType> [
    misc,
    location,
    character,
    item,
    quest,
  ];

  static final $core.Map<$core.int, NoteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NoteType? valueOf($core.int value) => _byValue[value];

  const NoteType._($core.int v, $core.String n) : super(v, n);
}

