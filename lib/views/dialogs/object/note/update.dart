import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/note/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateNote extends StatelessWidget {
  const UpdateNote(this.original, {super.key});

  final Note original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Note>(() => EditableNote.from(original));
  }
}
