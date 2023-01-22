///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'character.pbenum.dart';

export 'character.pbenum.dart';

class CharacterMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterMetadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revisions', $pb.PbFieldType.K3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storageSize', $pb.PbFieldType.O3)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdated', protoName: 'lastUpdated')
    ..hasRequiredFields = false
  ;

  CharacterMetadata._() : super();
  factory CharacterMetadata({
    $core.String? uuid,
    $core.String? name,
    $core.Iterable<$core.int>? revisions,
    $core.int? storageSize,
    $fixnum.Int64? lastUpdated,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (revisions != null) {
      _result.revisions.addAll(revisions);
    }
    if (storageSize != null) {
      _result.storageSize = storageSize;
    }
    if (lastUpdated != null) {
      _result.lastUpdated = lastUpdated;
    }
    return _result;
  }
  factory CharacterMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacterMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacterMetadata clone() => CharacterMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacterMetadata copyWith(void Function(CharacterMetadata) updates) => super.copyWith((message) => updates(message as CharacterMetadata)) as CharacterMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterMetadata create() => CharacterMetadata._();
  CharacterMetadata createEmptyInstance() => create();
  static $pb.PbList<CharacterMetadata> createRepeated() => $pb.PbList<CharacterMetadata>();
  @$core.pragma('dart2js:noInline')
  static CharacterMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterMetadata>(create);
  static CharacterMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get revisions => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get storageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set storageSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStorageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearStorageSize() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastUpdated => $_getI64(4);
  @$pb.TagNumber(5)
  set lastUpdated($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastUpdated() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastUpdated() => clearField(5);
}

class Character extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Character', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descriptor')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'focus')
    ..aOM<Progress>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'progress', subBuilder: Progress.create)
    ..aOM<Stats>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stats', subBuilder: Stats.create)
    ..aOM<Recovery>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recovery', subBuilder: Recovery.create)
    ..aOM<Damage>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'damage', subBuilder: Damage.create)
    ..pc<Skill>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'skills', $pb.PbFieldType.PM, subBuilder: Skill.create)
    ..pc<Ability>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'abilities', $pb.PbFieldType.PM, subBuilder: Ability.create)
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cypherLimit', $pb.PbFieldType.O3)
    ..pc<Cypher>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cyphers', $pb.PbFieldType.PM, subBuilder: Cypher.create)
    ..pc<Artifact>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artifacts', $pb.PbFieldType.PM, subBuilder: Artifact.create)
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'money', $pb.PbFieldType.OD)
    ..pc<Inventory>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inventories', $pb.PbFieldType.PM, subBuilder: Inventory.create)
    ..aOM<CharacterColor>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color', subBuilder: CharacterColor.create)
    ..pc<Item>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: Item.create)
    ..pc<Note>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes', $pb.PbFieldType.PM, subBuilder: Note.create)
    ..hasRequiredFields = false
  ;

  Character._() : super();
  factory Character({
    $core.String? uuid,
    $core.String? name,
    $core.String? descriptor,
    $core.String? type,
    $core.String? focus,
    Progress? progress,
    Stats? stats,
    Recovery? recovery,
    Damage? damage,
    $core.Iterable<Skill>? skills,
    $core.Iterable<Ability>? abilities,
    $core.int? cypherLimit,
    $core.Iterable<Cypher>? cyphers,
    $core.Iterable<Artifact>? artifacts,
    $core.double? money,
    $core.Iterable<Inventory>? inventories,
    CharacterColor? color,
    $core.Iterable<Item>? items,
    $core.Iterable<Note>? notes,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (descriptor != null) {
      _result.descriptor = descriptor;
    }
    if (type != null) {
      _result.type = type;
    }
    if (focus != null) {
      _result.focus = focus;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (stats != null) {
      _result.stats = stats;
    }
    if (recovery != null) {
      _result.recovery = recovery;
    }
    if (damage != null) {
      _result.damage = damage;
    }
    if (skills != null) {
      _result.skills.addAll(skills);
    }
    if (abilities != null) {
      _result.abilities.addAll(abilities);
    }
    if (cypherLimit != null) {
      _result.cypherLimit = cypherLimit;
    }
    if (cyphers != null) {
      _result.cyphers.addAll(cyphers);
    }
    if (artifacts != null) {
      _result.artifacts.addAll(artifacts);
    }
    if (money != null) {
      _result.money = money;
    }
    if (inventories != null) {
      _result.inventories.addAll(inventories);
    }
    if (color != null) {
      _result.color = color;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (notes != null) {
      _result.notes.addAll(notes);
    }
    return _result;
  }
  factory Character.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Character.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Character clone() => Character()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Character copyWith(void Function(Character) updates) => super.copyWith((message) => updates(message as Character)) as Character; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Character create() => Character._();
  Character createEmptyInstance() => create();
  static $pb.PbList<Character> createRepeated() => $pb.PbList<Character>();
  @$core.pragma('dart2js:noInline')
  static Character getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Character>(create);
  static Character? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get descriptor => $_getSZ(2);
  @$pb.TagNumber(3)
  set descriptor($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescriptor() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescriptor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get focus => $_getSZ(4);
  @$pb.TagNumber(5)
  set focus($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFocus() => $_has(4);
  @$pb.TagNumber(5)
  void clearFocus() => clearField(5);

  @$pb.TagNumber(6)
  Progress get progress => $_getN(5);
  @$pb.TagNumber(6)
  set progress(Progress v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasProgress() => $_has(5);
  @$pb.TagNumber(6)
  void clearProgress() => clearField(6);
  @$pb.TagNumber(6)
  Progress ensureProgress() => $_ensure(5);

  @$pb.TagNumber(7)
  Stats get stats => $_getN(6);
  @$pb.TagNumber(7)
  set stats(Stats v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStats() => $_has(6);
  @$pb.TagNumber(7)
  void clearStats() => clearField(7);
  @$pb.TagNumber(7)
  Stats ensureStats() => $_ensure(6);

  @$pb.TagNumber(8)
  Recovery get recovery => $_getN(7);
  @$pb.TagNumber(8)
  set recovery(Recovery v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecovery() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecovery() => clearField(8);
  @$pb.TagNumber(8)
  Recovery ensureRecovery() => $_ensure(7);

  @$pb.TagNumber(9)
  Damage get damage => $_getN(8);
  @$pb.TagNumber(9)
  set damage(Damage v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDamage() => $_has(8);
  @$pb.TagNumber(9)
  void clearDamage() => clearField(9);
  @$pb.TagNumber(9)
  Damage ensureDamage() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<Skill> get skills => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<Ability> get abilities => $_getList(10);

  @$pb.TagNumber(12)
  $core.int get cypherLimit => $_getIZ(11);
  @$pb.TagNumber(12)
  set cypherLimit($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCypherLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearCypherLimit() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<Cypher> get cyphers => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<Artifact> get artifacts => $_getList(13);

  @$pb.TagNumber(15)
  $core.double get money => $_getN(14);
  @$pb.TagNumber(15)
  set money($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasMoney() => $_has(14);
  @$pb.TagNumber(15)
  void clearMoney() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<Inventory> get inventories => $_getList(15);

  @$pb.TagNumber(17)
  CharacterColor get color => $_getN(16);
  @$pb.TagNumber(17)
  set color(CharacterColor v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasColor() => $_has(16);
  @$pb.TagNumber(17)
  void clearColor() => clearField(17);
  @$pb.TagNumber(17)
  CharacterColor ensureColor() => $_ensure(16);

  @$pb.TagNumber(18)
  $core.List<Item> get items => $_getList(17);

  @$pb.TagNumber(19)
  $core.List<Note> get notes => $_getList(18);
}

class CharacterColor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterColor', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'g', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'b', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CharacterColor._() : super();
  factory CharacterColor({
    $core.int? r,
    $core.int? g,
    $core.int? b,
  }) {
    final _result = create();
    if (r != null) {
      _result.r = r;
    }
    if (g != null) {
      _result.g = g;
    }
    if (b != null) {
      _result.b = b;
    }
    return _result;
  }
  factory CharacterColor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacterColor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacterColor clone() => CharacterColor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacterColor copyWith(void Function(CharacterColor) updates) => super.copyWith((message) => updates(message as CharacterColor)) as CharacterColor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterColor create() => CharacterColor._();
  CharacterColor createEmptyInstance() => create();
  static $pb.PbList<CharacterColor> createRepeated() => $pb.PbList<CharacterColor>();
  @$core.pragma('dart2js:noInline')
  static CharacterColor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterColor>(create);
  static CharacterColor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get r => $_getIZ(0);
  @$pb.TagNumber(1)
  set r($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasR() => $_has(0);
  @$pb.TagNumber(1)
  void clearR() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get g => $_getIZ(1);
  @$pb.TagNumber(2)
  set g($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasG() => $_has(1);
  @$pb.TagNumber(2)
  void clearG() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get b => $_getIZ(2);
  @$pb.TagNumber(3)
  set b($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasB() => $_has(2);
  @$pb.TagNumber(3)
  void clearB() => clearField(3);
}

class AdvancementInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AdvancementInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  AdvancementInfo._() : super();
  factory AdvancementInfo({
    $core.String? name,
    $core.String? description,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory AdvancementInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvancementInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdvancementInfo clone() => AdvancementInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdvancementInfo copyWith(void Function(AdvancementInfo) updates) => super.copyWith((message) => updates(message as AdvancementInfo)) as AdvancementInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdvancementInfo create() => AdvancementInfo._();
  AdvancementInfo createEmptyInstance() => create();
  static $pb.PbList<AdvancementInfo> createRepeated() => $pb.PbList<AdvancementInfo>();
  @$core.pragma('dart2js:noInline')
  static AdvancementInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdvancementInfo>(create);
  static AdvancementInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class Advancements extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Advancements', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'increaseCapabilities', protoName: 'increaseCapabilities')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moveTowardPerfection', protoName: 'moveTowardPerfection')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraEffort', protoName: 'extraEffort')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'skillTraining', protoName: 'skillTraining')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'other')
    ..hasRequiredFields = false
  ;

  Advancements._() : super();
  factory Advancements({
    $core.bool? increaseCapabilities,
    $core.bool? moveTowardPerfection,
    $core.bool? extraEffort,
    $core.bool? skillTraining,
    $core.bool? other,
  }) {
    final _result = create();
    if (increaseCapabilities != null) {
      _result.increaseCapabilities = increaseCapabilities;
    }
    if (moveTowardPerfection != null) {
      _result.moveTowardPerfection = moveTowardPerfection;
    }
    if (extraEffort != null) {
      _result.extraEffort = extraEffort;
    }
    if (skillTraining != null) {
      _result.skillTraining = skillTraining;
    }
    if (other != null) {
      _result.other = other;
    }
    return _result;
  }
  factory Advancements.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Advancements.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Advancements clone() => Advancements()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Advancements copyWith(void Function(Advancements) updates) => super.copyWith((message) => updates(message as Advancements)) as Advancements; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Advancements create() => Advancements._();
  Advancements createEmptyInstance() => create();
  static $pb.PbList<Advancements> createRepeated() => $pb.PbList<Advancements>();
  @$core.pragma('dart2js:noInline')
  static Advancements getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Advancements>(create);
  static Advancements? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get increaseCapabilities => $_getBF(0);
  @$pb.TagNumber(1)
  set increaseCapabilities($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIncreaseCapabilities() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncreaseCapabilities() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get moveTowardPerfection => $_getBF(1);
  @$pb.TagNumber(2)
  set moveTowardPerfection($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMoveTowardPerfection() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoveTowardPerfection() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get extraEffort => $_getBF(2);
  @$pb.TagNumber(3)
  set extraEffort($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtraEffort() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraEffort() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get skillTraining => $_getBF(3);
  @$pb.TagNumber(4)
  set skillTraining($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSkillTraining() => $_has(3);
  @$pb.TagNumber(4)
  void clearSkillTraining() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get other => $_getBF(4);
  @$pb.TagNumber(5)
  set other($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOther() => $_has(4);
  @$pb.TagNumber(5)
  void clearOther() => clearField(5);
}

class Progress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Progress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tier', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'freeXp', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalXp', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxEffort', $pb.PbFieldType.O3)
    ..aOM<Advancements>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advancements', subBuilder: Advancements.create)
    ..hasRequiredFields = false
  ;

  Progress._() : super();
  factory Progress({
    $core.int? tier,
    $core.int? freeXp,
    $core.int? totalXp,
    $core.int? maxEffort,
    Advancements? advancements,
  }) {
    final _result = create();
    if (tier != null) {
      _result.tier = tier;
    }
    if (freeXp != null) {
      _result.freeXp = freeXp;
    }
    if (totalXp != null) {
      _result.totalXp = totalXp;
    }
    if (maxEffort != null) {
      _result.maxEffort = maxEffort;
    }
    if (advancements != null) {
      _result.advancements = advancements;
    }
    return _result;
  }
  factory Progress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Progress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Progress clone() => Progress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Progress copyWith(void Function(Progress) updates) => super.copyWith((message) => updates(message as Progress)) as Progress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Progress create() => Progress._();
  Progress createEmptyInstance() => create();
  static $pb.PbList<Progress> createRepeated() => $pb.PbList<Progress>();
  @$core.pragma('dart2js:noInline')
  static Progress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Progress>(create);
  static Progress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tier => $_getIZ(0);
  @$pb.TagNumber(1)
  set tier($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTier() => $_has(0);
  @$pb.TagNumber(1)
  void clearTier() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get freeXp => $_getIZ(1);
  @$pb.TagNumber(2)
  set freeXp($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFreeXp() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeXp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalXp => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalXp($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalXp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalXp() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxEffort => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxEffort($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxEffort() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxEffort() => clearField(4);

  @$pb.TagNumber(5)
  Advancements get advancements => $_getN(4);
  @$pb.TagNumber(5)
  set advancements(Advancements v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAdvancements() => $_has(4);
  @$pb.TagNumber(5)
  void clearAdvancements() => clearField(5);
  @$pb.TagNumber(5)
  Advancements ensureAdvancements() => $_ensure(4);
}

class Stat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Stat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..e<PoolType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PoolType.intellect, valueOf: PoolType.valueOf, enumValues: PoolType.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cap', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pool', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'edge', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Stat._() : super();
  factory Stat({
    PoolType? type,
    $core.int? cap,
    $core.int? pool,
    $core.int? edge,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (cap != null) {
      _result.cap = cap;
    }
    if (pool != null) {
      _result.pool = pool;
    }
    if (edge != null) {
      _result.edge = edge;
    }
    return _result;
  }
  factory Stat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Stat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Stat clone() => Stat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Stat copyWith(void Function(Stat) updates) => super.copyWith((message) => updates(message as Stat)) as Stat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Stat create() => Stat._();
  Stat createEmptyInstance() => create();
  static $pb.PbList<Stat> createRepeated() => $pb.PbList<Stat>();
  @$core.pragma('dart2js:noInline')
  static Stat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stat>(create);
  static Stat? _defaultInstance;

  @$pb.TagNumber(1)
  PoolType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PoolType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cap => $_getIZ(1);
  @$pb.TagNumber(2)
  set cap($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCap() => $_has(1);
  @$pb.TagNumber(2)
  void clearCap() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pool => $_getIZ(2);
  @$pb.TagNumber(3)
  set pool($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPool() => $_has(2);
  @$pb.TagNumber(3)
  void clearPool() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get edge => $_getIZ(3);
  @$pb.TagNumber(4)
  set edge($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEdge() => $_has(3);
  @$pb.TagNumber(4)
  void clearEdge() => clearField(4);
}

class Stats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Stats', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOM<Stat>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intellect', subBuilder: Stat.create)
    ..aOM<Stat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speed', subBuilder: Stat.create)
    ..aOM<Stat>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'might', subBuilder: Stat.create)
    ..hasRequiredFields = false
  ;

  Stats._() : super();
  factory Stats({
    Stat? intellect,
    Stat? speed,
    Stat? might,
  }) {
    final _result = create();
    if (intellect != null) {
      _result.intellect = intellect;
    }
    if (speed != null) {
      _result.speed = speed;
    }
    if (might != null) {
      _result.might = might;
    }
    return _result;
  }
  factory Stats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Stats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Stats clone() => Stats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Stats copyWith(void Function(Stats) updates) => super.copyWith((message) => updates(message as Stats)) as Stats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Stats create() => Stats._();
  Stats createEmptyInstance() => create();
  static $pb.PbList<Stats> createRepeated() => $pb.PbList<Stats>();
  @$core.pragma('dart2js:noInline')
  static Stats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stats>(create);
  static Stats? _defaultInstance;

  @$pb.TagNumber(1)
  Stat get intellect => $_getN(0);
  @$pb.TagNumber(1)
  set intellect(Stat v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIntellect() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntellect() => clearField(1);
  @$pb.TagNumber(1)
  Stat ensureIntellect() => $_ensure(0);

  @$pb.TagNumber(2)
  Stat get speed => $_getN(1);
  @$pb.TagNumber(2)
  set speed(Stat v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpeed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpeed() => clearField(2);
  @$pb.TagNumber(2)
  Stat ensureSpeed() => $_ensure(1);

  @$pb.TagNumber(3)
  Stat get might => $_getN(2);
  @$pb.TagNumber(3)
  set might(Stat v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMight() => $_has(2);
  @$pb.TagNumber(3)
  void clearMight() => clearField(3);
  @$pb.TagNumber(3)
  Stat ensureMight() => $_ensure(2);
}

class Recovery extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Recovery', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bonus', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oneAction')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tenMinutes')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oneHour')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tenHours')
    ..hasRequiredFields = false
  ;

  Recovery._() : super();
  factory Recovery({
    $core.int? bonus,
    $core.bool? oneAction,
    $core.bool? tenMinutes,
    $core.bool? oneHour,
    $core.bool? tenHours,
  }) {
    final _result = create();
    if (bonus != null) {
      _result.bonus = bonus;
    }
    if (oneAction != null) {
      _result.oneAction = oneAction;
    }
    if (tenMinutes != null) {
      _result.tenMinutes = tenMinutes;
    }
    if (oneHour != null) {
      _result.oneHour = oneHour;
    }
    if (tenHours != null) {
      _result.tenHours = tenHours;
    }
    return _result;
  }
  factory Recovery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Recovery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Recovery clone() => Recovery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Recovery copyWith(void Function(Recovery) updates) => super.copyWith((message) => updates(message as Recovery)) as Recovery; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Recovery create() => Recovery._();
  Recovery createEmptyInstance() => create();
  static $pb.PbList<Recovery> createRepeated() => $pb.PbList<Recovery>();
  @$core.pragma('dart2js:noInline')
  static Recovery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recovery>(create);
  static Recovery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get bonus => $_getIZ(0);
  @$pb.TagNumber(1)
  set bonus($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBonus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBonus() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get oneAction => $_getBF(1);
  @$pb.TagNumber(2)
  set oneAction($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOneAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearOneAction() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get tenMinutes => $_getBF(2);
  @$pb.TagNumber(3)
  set tenMinutes($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTenMinutes() => $_has(2);
  @$pb.TagNumber(3)
  void clearTenMinutes() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get oneHour => $_getBF(3);
  @$pb.TagNumber(4)
  set oneHour($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOneHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearOneHour() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get tenHours => $_getBF(4);
  @$pb.TagNumber(5)
  set tenHours($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTenHours() => $_has(4);
  @$pb.TagNumber(5)
  void clearTenHours() => clearField(5);
}

class Damage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Damage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'impaired')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'debilitated')
    ..hasRequiredFields = false
  ;

  Damage._() : super();
  factory Damage({
    $core.bool? impaired,
    $core.bool? debilitated,
  }) {
    final _result = create();
    if (impaired != null) {
      _result.impaired = impaired;
    }
    if (debilitated != null) {
      _result.debilitated = debilitated;
    }
    return _result;
  }
  factory Damage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Damage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Damage clone() => Damage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Damage copyWith(void Function(Damage) updates) => super.copyWith((message) => updates(message as Damage)) as Damage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Damage create() => Damage._();
  Damage createEmptyInstance() => create();
  static $pb.PbList<Damage> createRepeated() => $pb.PbList<Damage>();
  @$core.pragma('dart2js:noInline')
  static Damage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Damage>(create);
  static Damage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get impaired => $_getBF(0);
  @$pb.TagNumber(1)
  set impaired($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImpaired() => $_has(0);
  @$pb.TagNumber(1)
  void clearImpaired() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get debilitated => $_getBF(1);
  @$pb.TagNumber(2)
  set debilitated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDebilitated() => $_has(1);
  @$pb.TagNumber(2)
  void clearDebilitated() => clearField(2);
}

class Skill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Skill', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..e<PoolType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PoolType.intellect, valueOf: PoolType.valueOf, enumValues: PoolType.values)
    ..e<SkillLevel>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: SkillLevel.specialized, valueOf: SkillLevel.valueOf, enumValues: SkillLevel.values)
    ..hasRequiredFields = false
  ;

  Skill._() : super();
  factory Skill({
    $core.String? uuid,
    $core.String? name,
    $core.String? description,
    PoolType? type,
    SkillLevel? level,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (type != null) {
      _result.type = type;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory Skill.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Skill.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Skill clone() => Skill()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Skill copyWith(void Function(Skill) updates) => super.copyWith((message) => updates(message as Skill)) as Skill; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Skill create() => Skill._();
  Skill createEmptyInstance() => create();
  static $pb.PbList<Skill> createRepeated() => $pb.PbList<Skill>();
  @$core.pragma('dart2js:noInline')
  static Skill getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Skill>(create);
  static Skill? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  PoolType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(PoolType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  SkillLevel get level => $_getN(4);
  @$pb.TagNumber(5)
  set level(SkillLevel v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);
}

class Ability extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ability', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cost')
    ..e<PoolType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PoolType.intellect, valueOf: PoolType.valueOf, enumValues: PoolType.values)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enabler')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription')
    ..hasRequiredFields = false
  ;

  Ability._() : super();
  factory Ability({
    $core.String? uuid,
    $core.String? name,
    $core.String? cost,
    PoolType? type,
    $core.bool? enabler,
    $core.String? description,
    $core.String? shortDescription,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cost != null) {
      _result.cost = cost;
    }
    if (type != null) {
      _result.type = type;
    }
    if (enabler != null) {
      _result.enabler = enabler;
    }
    if (description != null) {
      _result.description = description;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    return _result;
  }
  factory Ability.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ability.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ability clone() => Ability()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ability copyWith(void Function(Ability) updates) => super.copyWith((message) => updates(message as Ability)) as Ability; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ability create() => Ability._();
  Ability createEmptyInstance() => create();
  static $pb.PbList<Ability> createRepeated() => $pb.PbList<Ability>();
  @$core.pragma('dart2js:noInline')
  static Ability getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ability>(create);
  static Ability? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cost => $_getSZ(2);
  @$pb.TagNumber(3)
  set cost($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearCost() => clearField(3);

  @$pb.TagNumber(4)
  PoolType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(PoolType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get enabler => $_getBF(4);
  @$pb.TagNumber(5)
  set enabler($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnabler() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnabler() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get shortDescription => $_getSZ(6);
  @$pb.TagNumber(7)
  set shortDescription($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasShortDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearShortDescription() => clearField(7);
}

class Cypher extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cypher', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'effect')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depletion')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'internal')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wearable')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usable')
    ..hasRequiredFields = false
  ;

  Cypher._() : super();
  factory Cypher({
    $core.String? uuid,
    $core.String? name,
    $core.String? level,
    $core.String? shortDescription,
    $core.String? effect,
    $core.bool? active,
    $core.String? depletion,
    $core.String? internal,
    $core.String? wearable,
    $core.String? usable,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (active != null) {
      _result.active = active;
    }
    if (depletion != null) {
      _result.depletion = depletion;
    }
    if (internal != null) {
      _result.internal = internal;
    }
    if (wearable != null) {
      _result.wearable = wearable;
    }
    if (usable != null) {
      _result.usable = usable;
    }
    return _result;
  }
  factory Cypher.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cypher.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Cypher clone() => Cypher()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Cypher copyWith(void Function(Cypher) updates) => super.copyWith((message) => updates(message as Cypher)) as Cypher; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Cypher create() => Cypher._();
  Cypher createEmptyInstance() => create();
  static $pb.PbList<Cypher> createRepeated() => $pb.PbList<Cypher>();
  @$core.pragma('dart2js:noInline')
  static Cypher getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cypher>(create);
  static Cypher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get level => $_getSZ(2);
  @$pb.TagNumber(3)
  set level($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortDescription => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortDescription($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShortDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get effect => $_getSZ(4);
  @$pb.TagNumber(5)
  set effect($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEffect() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffect() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get depletion => $_getSZ(6);
  @$pb.TagNumber(7)
  set depletion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDepletion() => $_has(6);
  @$pb.TagNumber(7)
  void clearDepletion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get internal => $_getSZ(7);
  @$pb.TagNumber(8)
  set internal($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInternal() => $_has(7);
  @$pb.TagNumber(8)
  void clearInternal() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get wearable => $_getSZ(8);
  @$pb.TagNumber(9)
  set wearable($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWearable() => $_has(8);
  @$pb.TagNumber(9)
  void clearWearable() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get usable => $_getSZ(9);
  @$pb.TagNumber(10)
  set usable($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUsable() => $_has(9);
  @$pb.TagNumber(10)
  void clearUsable() => clearField(10);
}

class Artifact extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Artifact', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'effect')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depletion')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'form')
    ..hasRequiredFields = false
  ;

  Artifact._() : super();
  factory Artifact({
    $core.String? uuid,
    $core.String? name,
    $core.String? level,
    $core.String? shortDescription,
    $core.String? effect,
    $core.bool? active,
    $core.String? depletion,
    $core.String? form,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (active != null) {
      _result.active = active;
    }
    if (depletion != null) {
      _result.depletion = depletion;
    }
    if (form != null) {
      _result.form = form;
    }
    return _result;
  }
  factory Artifact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Artifact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Artifact clone() => Artifact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Artifact copyWith(void Function(Artifact) updates) => super.copyWith((message) => updates(message as Artifact)) as Artifact; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Artifact create() => Artifact._();
  Artifact createEmptyInstance() => create();
  static $pb.PbList<Artifact> createRepeated() => $pb.PbList<Artifact>();
  @$core.pragma('dart2js:noInline')
  static Artifact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Artifact>(create);
  static Artifact? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get level => $_getSZ(2);
  @$pb.TagNumber(3)
  set level($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortDescription => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortDescription($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShortDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get effect => $_getSZ(4);
  @$pb.TagNumber(5)
  set effect($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEffect() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffect() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get depletion => $_getSZ(6);
  @$pb.TagNumber(7)
  set depletion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDepletion() => $_has(6);
  @$pb.TagNumber(7)
  void clearDepletion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get form => $_getSZ(7);
  @$pb.TagNumber(8)
  set form($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasForm() => $_has(7);
  @$pb.TagNumber(8)
  void clearForm() => clearField(8);
}

class Inventory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Inventory', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Inventory._() : super();
  factory Inventory({
    $core.String? uuid,
    $core.String? name,
    $core.int? order,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory Inventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Inventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Inventory clone() => Inventory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Inventory copyWith(void Function(Inventory) updates) => super.copyWith((message) => updates(message as Inventory)) as Inventory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Inventory create() => Inventory._();
  Inventory createEmptyInstance() => create();
  static $pb.PbList<Inventory> createRepeated() => $pb.PbList<Inventory>();
  @$core.pragma('dart2js:noInline')
  static Inventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Inventory>(create);
  static Inventory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(4)
  $core.int get order => $_getIZ(2);
  @$pb.TagNumber(4)
  set order($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(2);
  @$pb.TagNumber(4)
  void clearOrder() => clearField(4);
}

class ItemPath extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ItemPath', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inventory')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parent')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'self')
    ..hasRequiredFields = false
  ;

  ItemPath._() : super();
  factory ItemPath({
    $core.String? inventory,
    $core.String? parent,
    $core.String? self,
  }) {
    final _result = create();
    if (inventory != null) {
      _result.inventory = inventory;
    }
    if (parent != null) {
      _result.parent = parent;
    }
    if (self != null) {
      _result.self = self;
    }
    return _result;
  }
  factory ItemPath.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ItemPath.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ItemPath clone() => ItemPath()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ItemPath copyWith(void Function(ItemPath) updates) => super.copyWith((message) => updates(message as ItemPath)) as ItemPath; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ItemPath create() => ItemPath._();
  ItemPath createEmptyInstance() => create();
  static $pb.PbList<ItemPath> createRepeated() => $pb.PbList<ItemPath>();
  @$core.pragma('dart2js:noInline')
  static ItemPath getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ItemPath>(create);
  static ItemPath? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get inventory => $_getSZ(0);
  @$pb.TagNumber(1)
  set inventory($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInventory() => $_has(0);
  @$pb.TagNumber(1)
  void clearInventory() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get self => $_getSZ(2);
  @$pb.TagNumber(3)
  set self($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelf() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelf() => clearField(3);
}

class Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Item', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOM<ItemPath>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path', subBuilder: ItemPath.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription')
    ..pc<ItemType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'types', $pb.PbFieldType.KE, valueOf: ItemType.valueOf, enumValues: ItemType.values, defaultEnumValue: ItemType.armor)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..e<ItemType>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subItemType', $pb.PbFieldType.OE, defaultOrMaker: ItemType.armor, valueOf: ItemType.valueOf, enumValues: ItemType.values)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OD)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'armor', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Item._() : super();
  factory Item({
    ItemPath? path,
    $core.String? name,
    $core.String? description,
    $core.String? shortDescription,
    $core.Iterable<ItemType>? types,
    $core.double? amount,
    ItemType? subItemType,
    $core.double? value,
    $core.int? armor,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (types != null) {
      _result.types.addAll(types);
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (subItemType != null) {
      _result.subItemType = subItemType;
    }
    if (value != null) {
      _result.value = value;
    }
    if (armor != null) {
      _result.armor = armor;
    }
    return _result;
  }
  factory Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Item clone() => Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Item copyWith(void Function(Item) updates) => super.copyWith((message) => updates(message as Item)) as Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Item create() => Item._();
  Item createEmptyInstance() => create();
  static $pb.PbList<Item> createRepeated() => $pb.PbList<Item>();
  @$core.pragma('dart2js:noInline')
  static Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Item>(create);
  static Item? _defaultInstance;

  @$pb.TagNumber(1)
  ItemPath get path => $_getN(0);
  @$pb.TagNumber(1)
  set path(ItemPath v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
  @$pb.TagNumber(1)
  ItemPath ensurePath() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortDescription => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortDescription($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShortDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<ItemType> get types => $_getList(4);

  @$pb.TagNumber(6)
  $core.double get amount => $_getN(5);
  @$pb.TagNumber(6)
  set amount($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearAmount() => clearField(6);

  @$pb.TagNumber(7)
  ItemType get subItemType => $_getN(6);
  @$pb.TagNumber(7)
  set subItemType(ItemType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSubItemType() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubItemType() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get value => $_getN(7);
  @$pb.TagNumber(8)
  set value($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearValue() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get armor => $_getIZ(8);
  @$pb.TagNumber(9)
  set armor($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasArmor() => $_has(8);
  @$pb.TagNumber(9)
  void clearArmor() => clearField(9);
}

class Note extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Note', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..e<NoteType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NoteType.misc, valueOf: NoteType.valueOf, enumValues: NoteType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription', protoName: 'shortDescription')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  Note._() : super();
  factory Note({
    $core.String? uuid,
    $core.String? title,
    NoteType? type,
    $core.String? shortDescription,
    $core.String? text,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory Note.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Note.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Note clone() => Note()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Note copyWith(void Function(Note) updates) => super.copyWith((message) => updates(message as Note)) as Note; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Note create() => Note._();
  Note createEmptyInstance() => create();
  static $pb.PbList<Note> createRepeated() => $pb.PbList<Note>();
  @$core.pragma('dart2js:noInline')
  static Note getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Note>(create);
  static Note? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  NoteType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(NoteType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortDescription => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortDescription($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShortDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get text => $_getSZ(4);
  @$pb.TagNumber(5)
  set text($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasText() => $_has(4);
  @$pb.TagNumber(5)
  void clearText() => clearField(5);
}

