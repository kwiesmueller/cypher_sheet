// TODO: generate this code
import 'package:cypher_sheet/extensions/editable.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/inputs.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class EditableSkill extends GenericEditable<Skill> {
  factory EditableSkill.empty() {
    return EditableSkill._(Skill.create());
  }

  factory EditableSkill.from(Skill original) {
    return EditableSkill._(original);
  }

  EditableSkill._(Skill original)
      : type = original.hasType() ? original.type : PoolType.intellect,
        level = original.hasLevel() ? original.level : SkillLevel.trained,
        super(
          "Skill",
          createNewEmpty: () => Skill.create(),
          updateInState: (CharacterNotifier ref) => ref.updateSkill,
          createInState: (CharacterNotifier ref) => ref.addSkill,
          deleteInState: (CharacterNotifier ref) => ref.deleteSkill,
          clearUuid: (Skill obj) => obj.clearUuid(),
          setUuid: (Skill obj, String uuid) => obj.uuid = uuid,
          originalUUID: original.uuid,
          textFields: getEditableTextFieldsFrom(original),
          boolFields: {},
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return SkillEditInputs(this, setState);
  }

  TextEditingController get name => textFields["name"]!;
  TextEditingController get description => textFields["description"]!;

  PoolType type;
  SkillLevel level;

  @override
  void setOtherFields(Skill obj) {
    obj.type = type;
    obj.level = level;
  }

  @override
  String get objectName => name.value.text;
}
