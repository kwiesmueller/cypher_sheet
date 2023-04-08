import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:flutter/material.dart';

class BaseEditView extends StatelessWidget {
  const BaseEditView({
    super.key,
    required this.action,
    required this.type,
    required this.inputs,
    this.onDelete,
    required this.onSubmit,
  });

  final String type;
  final String action;
  final Widget inputs;
  final Function()? onDelete;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                "$action $type",
                align: TextAlign.left,
              ),
              if (onDelete != null)
                AppBox(
                    flat: true,
                    padding: 2,
                    onTap: onDelete,
                    child: const AppIcon(
                      AppIcons.deleteForever,
                      size: 24,
                    )),
            ],
          ),
        ),
        Expanded(
          child: inputs,
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: onSubmit,
          color: Theme.of(context).colorScheme.primary,
          child: AppText(action),
        ),
      ],
    );
  }
}
