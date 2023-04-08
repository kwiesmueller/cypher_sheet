import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/note/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportNote extends StatelessWidget {
  const ImportNote(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Note original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Note>(
      () => EditableNote.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
