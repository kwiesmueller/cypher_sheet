import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/markdown.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/state/providers/cyphers.dart';
import 'package:cypher_sheet/views/dialogs/create_cypher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class ViewCypher extends ConsumerWidget {
  const ViewCypher({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cypher = ref.watch(cypherProvider(uuid));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppText(
                  cypher.name,
                  align: TextAlign.left,
                ),
              ),
              if (cypher.level.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppBox(
                    padding: 8,
                    constraints: const BoxConstraints(minWidth: 42),
                    child: AppText(
                      cypher.level,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              AppBox(
                  flat: true,
                  padding: 2,
                  onTap: () {
                    showAppDialog(
                      context,
                      CreateCypher.fromState(cypher),
                      fullscreen: true,
                    );
                  },
                  child: const AppIcon(
                    AppIcons.edit,
                    size: 24,
                  )),
            ],
          ),
        ),
        if (cypher.shortDescription.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AppText(
              cypher.shortDescription,
              style: Theme.of(context).textTheme.bodySmall,
              align: TextAlign.left,
              maxLines: 3,
            ),
          ),
        Expanded(
          child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  LabeledAppBox(label: "Depletion", value: cypher.depletion),
                  const SizedBox(width: 28.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        AppCheckbox(
                          active: cypher.active,
                        ),
                        const SizedBox(width: 16.0),
                        const AppLabel(
                          text: "Active",
                          paddingBottom: 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 28.0),
            if (cypher.internal.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LabeledAppBox(
                  label: "Internal",
                  value: cypher.internal,
                  flat: true,
                  maxLines: 3,
                ),
              ),
            if (cypher.wearable.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LabeledAppBox(
                  label: "Wearable",
                  value: cypher.wearable,
                  flat: true,
                  maxLines: 3,
                ),
              ),
            if (cypher.usable.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LabeledAppBox(
                  label: "Usable",
                  value: cypher.usable,
                  flat: true,
                  maxLines: 3,
                ),
              ),
            const SizedBox(height: 16.0),
            const AppLabel(text: "Effect"),
            AppMarkdown(data: cypher.effect),
          ]),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            closeDialog(context);
          }),
          child: const AppText("Close"),
        ),
      ],
    );
  }
}
