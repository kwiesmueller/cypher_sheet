import 'package:cypher_sheet/views/dialogs/object/base/update.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/dialog.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class UpdateDialog<OriginalT> extends StatelessWidget {
  const UpdateDialog(this.editableCreator, {super.key});

  final Editable<OriginalT> Function() editableCreator;

  @override
  Widget build(BuildContext context) {
    return GenericEditDialog<OriginalT>(
      (Editable<OriginalT> edit, setState, ref) => BaseUpdateView(
        action: "Update",
        type: edit.typeName,
        inputs: edit.inputs(setState),
        onSubmit: () {
          edit.update(ref);
        },
        onDelete: () {
          edit.delete(ref);
        },
        getName: () => edit.objectName,
      ),
      editableCreator,
    );
  }
}
