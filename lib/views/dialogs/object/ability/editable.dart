// TODO: generate this code
import 'package:cypher_sheet/extensions/editable.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/inputs.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class EditableAbility extends GenericEditable<Ability> {
  factory EditableAbility.empty() {
    return EditableAbility._(Ability.create());
  }

  factory EditableAbility.from(Ability original) {
    return EditableAbility._(original);
  }

  EditableAbility._(Ability original)
      : type = original.hasType() ? original.type : PoolType.intellect,
        super(
          "Ability",
          createNewEmpty: () => Ability.create(),
          updateInState: (CharacterNotifier ref) => ref.updateAbility,
          createInState: (CharacterNotifier ref) => ref.addAbility,
          deleteInState: (CharacterNotifier ref) => ref.deleteAbility,
          clearUuid: (Ability obj) => obj.clearUuid(),
          setUuid: (Ability obj, String uuid) => obj.uuid = uuid,
          originalUUID: original.uuid,
          textFields: getEditableTextFieldsFrom(original),
          boolFields: getEditableBoolFieldsFrom(original),
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return AbilityEditInputs(this, setState);
  }

  bool get enabler => boolFields["enabler"]!;
  set enabler(bool to) => boolFields["enabler"] = to;

  TextEditingController get name => textFields["name"]!;
  TextEditingController get cost => textFields["cost"]!;
  TextEditingController get shortDescription => textFields["shortDescription"]!;
  TextEditingController get description => textFields["description"]!;

  PoolType type;

  @override
  void setOtherFields(Ability obj) {
    obj.type = type;
  }

  @override
  String get objectName => name.value.text;
}
