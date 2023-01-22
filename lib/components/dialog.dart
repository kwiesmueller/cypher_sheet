import 'package:cypher_sheet/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';

Future<T?> showAppDialog<T>(BuildContext context, Widget child,
    {bool fullscreen = true}) {
  return showDialog(
    context: context,
    builder: (c) {
      return AppDialog(
        fullscreen: fullscreen,
        child: ProviderScope(
          parent: ProviderScope.containerOf(context),
          child: child,
        ),
      );
    },
  );
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
    this.fullscreen = false,
  });

  final Widget child;
  final bool fullscreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: fullscreen ? EdgeInsets.zero : const EdgeInsets.all(16.0),
        child: Container(
          decoration: appBoxDecoration(
            context,
            color: Theme.of(context).colorScheme.surfaceTint,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

void closeDialog(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

class DialogTextBox extends StatelessWidget {
  const DialogTextBox({
    super.key,
    required this.initialValue,
    required this.controller,
    required this.label,
    this.multiLine = false,
  });

  final String label;
  final String initialValue;
  final TextEditingController controller;
  final bool multiLine;

  @override
  Widget build(BuildContext context) {
    return AppTextEdit(
      controller: controller,
      value: initialValue,
      label: label,
      onEditingComplete: (newValue) {},
      customPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      textAlign: TextAlign.left,
      labelAlign: TextAlign.left,
      maxLines: multiLine ? null : 1,
      minLines: multiLine ? 3 : 1,
      textInputType: multiLine ? TextInputType.multiline : TextInputType.text,
      textStyle: multiLine ? Theme.of(context).textTheme.labelLarge : null,
      startWithFullTextSelected: !multiLine,
      showCursor: true,
    );
  }
}
