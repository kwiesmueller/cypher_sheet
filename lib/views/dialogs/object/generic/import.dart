import 'package:cypher_sheet/views/dialogs/object/base/import.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/dialog.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';

class ImportDialog<OriginalT> extends StatelessWidget {
  const ImportDialog(
    this.editableCreator, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Editable<OriginalT> Function() editableCreator;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return GenericEditDialog<OriginalT>(
      (edit, setState, ref) => BaseImportView(
        action: "Import",
        type: edit.typeName,
        inputs: edit.inputs(setState),
        onSubmit: () {
          edit.import(ref);
          if (onSuccess != null) onSuccess!();
        },
        onCancel: onCancel ?? () {},
        getName: () => edit.objectName,
      ),
      editableCreator,
    );
  }
}
