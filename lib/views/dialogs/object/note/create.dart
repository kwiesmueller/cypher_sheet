import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/note/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:flutter/widgets.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Note>(() => EditableNote.empty());
  }
}
