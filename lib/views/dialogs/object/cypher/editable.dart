// TODO: generate this code
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/inputs.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class EditableCypher extends GenericEditable<Cypher> {
  factory EditableCypher.empty() {
    final original = Cypher.create();
    final edit = EditableCypher._(original);
    edit.loadFields(original);
    return edit;
  }

  factory EditableCypher.from(Cypher original) {
    final edit = EditableCypher._(original);
    edit.loadFields(original);
    return edit;
  }

  EditableCypher._(Cypher original)
      : super(
          "Cypher",
          createNewEmpty: () => Cypher.create(),
          updateInState: (CharacterNotifier ref) => ref.updateCypher,
          createInState: (CharacterNotifier ref) => ref.addCypher,
          deleteInState: (CharacterNotifier ref) => ref.deleteCypher,
          clearUuid: (Cypher obj) => obj.clearUuid(),
          setUuid: (Cypher obj, String uuid) => obj.uuid = uuid,
          originalUUID: original.uuid,
          // This editable loads all fields at once as there are too many different kinds.
          textFields: {},
          boolFields: {},
          doubleFields: {},
          intFields: {},
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return CypherEditInputs(this, setState);
  }

  bool get active => boolFields["active"]!;
  set active(bool to) => boolFields["active"] = to;

  TextEditingController get depletion => textFields["depletion"]!;
  TextEditingController get effect => textFields["effect"]!;
  TextEditingController get internal => textFields["internal"]!;
  TextEditingController get level => textFields["level"]!;
  TextEditingController get name => textFields["name"]!;
  TextEditingController get shortDescription => textFields["shortDescription"]!;
  TextEditingController get usable => textFields["usable"]!;
  TextEditingController get uuid => textFields["uuid"]!;
  TextEditingController get wearable => textFields["wearable"]!;

  @override
  String get objectName => name.value.text;
}
