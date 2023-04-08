import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/views/dialogs/object/base/edit.dart';
import 'package:flutter/material.dart';

class BaseCreateView extends StatelessWidget {
  const BaseCreateView({
    super.key,
    this.action = "Create",
    required this.type,
    required this.inputs,
    required this.onSubmit,
  });

  final String type;
  final String action;
  final Widget inputs;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return BaseEditView(
      action: action,
      type: type,
      inputs: inputs,
      onSubmit: () {
        onSubmit();
        closeDialog(context);
      },
    );
  }
}
