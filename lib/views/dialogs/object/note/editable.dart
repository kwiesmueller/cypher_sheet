// TODO: generate this code
import 'package:cypher_sheet/extensions/editable.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/views/dialogs/object/note/inputs.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class EditableNote extends GenericEditable<Note> {
  factory EditableNote.empty() {
    return EditableNote._(Note.create());
  }

  factory EditableNote.from(Note original) {
    return EditableNote._(original);
  }

  EditableNote._(Note original)
      : type = original.hasType() ? original.type : NoteType.misc,
        super(
          "Note",
          createNewEmpty: () => Note.create(),
          updateInState: (CharacterNotifier ref) => ref.updateNote,
          createInState: (CharacterNotifier ref) => ref.addNote,
          deleteInState: (CharacterNotifier ref) => ref.deleteNote,
          clearUuid: (Note obj) => obj.clearUuid(),
          setUuid: (Note obj, String uuid) => obj.uuid = uuid,
          originalUUID: original.uuid,
          textFields: getEditableTextFieldsFrom(original),
          boolFields: {},
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return NoteEditInputs(this, setState);
  }

  TextEditingController get title => textFields["title"]!;
  TextEditingController get shortDescription => textFields["shortDescription"]!;
  TextEditingController get text => textFields["text"]!;

  NoteType type;

  @override
  void setOtherFields(Note obj) {
    obj.type = type;
  }

  @override
  String get objectName => title.value.text;
}
