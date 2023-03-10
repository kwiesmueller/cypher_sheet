///
//  Generated code. Do not modify.
//  source: characters.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'character.pb.dart' as $1;

class WriteCharacter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WriteCharacter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'characters'), createEmptyInstance: create)
    ..aOM<$1.Character>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'character', subBuilder: $1.Character.create)
    ..hasRequiredFields = false
  ;

  WriteCharacter._() : super();
  factory WriteCharacter({
    $1.Character? character,
  }) {
    final _result = create();
    if (character != null) {
      _result.character = character;
    }
    return _result;
  }
  factory WriteCharacter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteCharacter clone() => WriteCharacter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteCharacter copyWith(void Function(WriteCharacter) updates) => super.copyWith((message) => updates(message as WriteCharacter)) as WriteCharacter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteCharacter create() => WriteCharacter._();
  WriteCharacter createEmptyInstance() => create();
  static $pb.PbList<WriteCharacter> createRepeated() => $pb.PbList<WriteCharacter>();
  @$core.pragma('dart2js:noInline')
  static WriteCharacter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteCharacter>(create);
  static WriteCharacter? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Character get character => $_getN(0);
  @$pb.TagNumber(1)
  set character($1.Character v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCharacter() => $_has(0);
  @$pb.TagNumber(1)
  void clearCharacter() => clearField(1);
  @$pb.TagNumber(1)
  $1.Character ensureCharacter() => $_ensure(0);
}

class CharacterWritten extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterWritten', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'characters'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..hasRequiredFields = false
  ;

  CharacterWritten._() : super();
  factory CharacterWritten({
    $core.String? uuid,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    return _result;
  }
  factory CharacterWritten.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacterWritten.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacterWritten clone() => CharacterWritten()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacterWritten copyWith(void Function(CharacterWritten) updates) => super.copyWith((message) => updates(message as CharacterWritten)) as CharacterWritten; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterWritten create() => CharacterWritten._();
  CharacterWritten createEmptyInstance() => create();
  static $pb.PbList<CharacterWritten> createRepeated() => $pb.PbList<CharacterWritten>();
  @$core.pragma('dart2js:noInline')
  static CharacterWritten getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterWritten>(create);
  static CharacterWritten? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);
}

