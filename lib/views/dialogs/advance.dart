import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/extensions/advancements.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class Advance extends ConsumerWidget {
  const Advance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canAdvanceTier = ref.watch(advancementsProvider).canAdvanceTier();
    final progress = ref.watch(progressProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 28.0),
          child: AppText(
            "Advance",
            align: TextAlign.left,
          ),
        ),
        NumberChip(label: "Free XP", value: progress.freeXp),
        const SizedBox(height: 8.0),
        NumberChip(
            label: "Available\nAdvancements",
            value: (progress.freeXp / progress.advancements.xpPerAdvancement())
                .floor()),
        const SizedBox(height: 16.0),
        const AdvancementCheckBox(
            advancement: Advancement.increaseCapabilities),
        const AdvancementCheckBox(
            advancement: Advancement.moveTowardPerfection),
        const AdvancementCheckBox(advancement: Advancement.extraEffort),
        const AdvancementCheckBox(advancement: Advancement.skillTraining),
        const AdvancementCheckBox(advancement: Advancement.other),
        if (canAdvanceTier) const SizedBox(height: 28.0),
        if (canAdvanceTier)
          AppBox(
            color: Theme.of(context).colorScheme.primary,
            onTap: () {
              ref.read(characterProvider.notifier).advanceTier(1);
              closeDialog(context);
            },
            child: const AppText("Advance Tier"),
          ),
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

class AdvancementCheckBox extends ConsumerWidget {
  const AdvancementCheckBox({super.key, required this.advancement});

  final Advancement advancement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: AppBox(
        flat: true,
        padding: 0,
        onTapGesture: () {
          ref.read(characterProvider.notifier).toggleAdvancement(advancement);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: AppCheckbox(
                active:
                    ref.watch(advancementsProvider).advancement(advancement),
                onTap: () {
                  ref
                      .read(characterProvider.notifier)
                      .toggleAdvancement(advancement);
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    advancement.info().name,
                    align: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  AppText(
                    advancement.info().description,
                    align: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
