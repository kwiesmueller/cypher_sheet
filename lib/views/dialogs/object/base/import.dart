import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/views/dialogs/object/base/edit.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';

class BaseImportView extends StatelessWidget {
  const BaseImportView({
    super.key,
    this.action = "Import",
    required this.type,
    required this.inputs,
    required this.onSubmit,
    required this.onCancel,
    required this.getName,
  });

  final String type;
  final String action;
  final Widget inputs;
  final Function() onSubmit;
  final Function() onCancel;
  final String Function() getName;

  @override
  Widget build(BuildContext context) {
    return BaseEditView(
      action: action,
      type: type,
      inputs: inputs,
      onDelete: () {
        showConfirmDialog(
            context,
            AppText(
              "Abort\n${getName()}",
              maxLines: 2,
              style: Theme.of(context).textTheme.labelLarge,
            ), () {
          onCancel();
          closeDialog(context);
        });
      },
      onSubmit: () {
        onSubmit();
        closeDialog(context);
      },
    );
  }
}
