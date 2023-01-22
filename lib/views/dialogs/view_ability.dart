import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/markdown.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/state/providers/abilities.dart';
import 'package:cypher_sheet/views/dialogs/create_ability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class ViewAbility extends ConsumerWidget {
  const ViewAbility({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ability = ref.watch(abilityProvider(uuid));

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
                  ability.name,
                  align: TextAlign.left,
                ),
              ),
              if (ability.cost.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppBox(
                    padding: 8,
                    constraints: const BoxConstraints(minWidth: 42),
                    child: AppText(
                      ability.cost,
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
                      CreateAbility.fromState(ability),
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
        if (ability.shortDescription.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AppText(
              ability.shortDescription,
              style: Theme.of(context).textTheme.bodySmall,
              align: TextAlign.left,
              maxLines: 3,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBox(
                padding: 4,
                borderRadius: 8,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: AppIcon(
                  ability.type.toIcon(),
                  size: 22,
                ),
              ),
              const SizedBox(width: 16.0),
              AppCheckbox(
                active: ability.enabler,
              ),
              const SizedBox(width: 16.0),
              AppText(
                "Enabler",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                align: TextAlign.left,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        AppMarkdown(data: ability.description),
        const Spacer(),
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
