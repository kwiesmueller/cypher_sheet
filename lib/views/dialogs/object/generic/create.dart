import 'package:cypher_sheet/views/dialogs/object/base/create.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/dialog.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class CreateDialog<OriginalT> extends StatelessWidget {
  const CreateDialog(this.editableCreator, {super.key});

  final Editable<OriginalT> Function() editableCreator;

  @override
  Widget build(BuildContext context) {
    return GenericEditDialog<OriginalT>(
      (edit, setState, ref) => BaseCreateView(
        action: "Create",
        type: edit.typeName,
        inputs: edit.inputs(setState),
        onSubmit: () {
          edit.create(ref);
        },
      ),
      editableCreator,
    );
  }
}
