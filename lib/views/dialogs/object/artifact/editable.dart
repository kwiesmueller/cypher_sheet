// TODO: generate this code
import 'package:cypher_sheet/extensions/editable.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/inputs.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class EditableArtifact extends GenericEditable<Artifact> {
  factory EditableArtifact.empty() {
    return EditableArtifact._(Artifact.create());
  }

  factory EditableArtifact.from(Artifact original) {
    return EditableArtifact._(original);
  }

  EditableArtifact._(Artifact original)
      : super(
          "Artifact",
          createNewEmpty: () => Artifact.create(),
          updateInState: (CharacterNotifier ref) => ref.updateArtifact,
          createInState: (CharacterNotifier ref) => ref.addArtifact,
          deleteInState: (CharacterNotifier ref) => ref.deleteArtifact,
          clearUuid: (Artifact obj) => obj.clearUuid(),
          setUuid: (Artifact obj, String uuid) => obj.uuid = uuid,
          originalUUID: original.uuid,
          textFields: getEditableTextFieldsFrom(original),
          boolFields: getEditableBoolFieldsFrom(original),
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return ArtifactEditInputs(this, setState);
  }

  bool get active => boolFields["active"]!;
  set active(bool to) => boolFields["active"] = to;

  TextEditingController get name => textFields["name"]!;
  TextEditingController get level => textFields["level"]!;
  TextEditingController get shortDescription => textFields["shortDescription"]!;
  TextEditingController get effect => textFields["effect"]!;
  TextEditingController get depletion => textFields["depletion"]!;
  TextEditingController get form => textFields["form"]!;

  @override
  String get objectName => name.value.text;
}
