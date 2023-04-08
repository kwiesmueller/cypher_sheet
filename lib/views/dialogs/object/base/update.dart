import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/views/dialogs/object/base/edit.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';

class BaseUpdateView extends StatelessWidget {
  const BaseUpdateView({
    super.key,
    this.action = "Update",
    required this.type,
    required this.inputs,
    required this.onSubmit,
    required this.onDelete,
    required this.getName,
  });

  final String type;
  final String action;
  final Widget inputs;
  final Function() onSubmit;
  final Function() onDelete;
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
              "Permanently delete\n${getName()}",
              maxLines: 2,
              style: Theme.of(context).textTheme.labelLarge,
            ), () {
          onDelete();
          closeDialog(context);
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
