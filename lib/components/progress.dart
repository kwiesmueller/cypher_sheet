import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/spacer.dart';
import 'package:cypher_sheet/components/stat.dart';
import 'package:cypher_sheet/extensions/advancements.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/advance.dart';
import 'package:cypher_sheet/views/dialogs/effort.dart';
import 'package:cypher_sheet/views/dialogs/xp.dart';

class ProgressView extends ConsumerWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SimpleStatBox(
          type: "XP",
          value: progress.freeXp,
          onTap: (() {
            showAppDialog(context, const XPEdit());
          }),
        ),
        Expanded(child: AdvancementBox(progress.advancements)),
        SimpleStatBox(
          type: "Effort",
          value: progress.maxEffort,
          onTap: () {
            showAppDialog(context, const EffortEdit());
          },
        ),
      ],
    );
  }
}

class AdvancementBox extends ConsumerWidget {
  const AdvancementBox(this.advancements, {super.key});

  final Advancements advancements;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAdvancements = advancements.activeCount();
    final advancementsPerTier = advancements.advancementsPerTier();

    const spacer = AppSpacer();
    var boxes = <Widget>[
      spacer,
    ];

    if (advancements.canAdvanceTier()) {
      boxes = <Widget>[
        const AppIcon(AppIcons.advanceTier),
      ];
    } else {
      for (var i = 0; i < advancementsPerTier; i++) {
        boxes.add(Flexible(
            child: AppCheckbox(
          active: i < activeAdvancements,
          size: 32,
        )));
        boxes.add(spacer);
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: AppBox(
        onTap: () {
          showAppDialog(context, const Advance());
        },
        constraints: const BoxConstraints(minHeight: defaultStatBoxSize),
        padding: 0,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List<Widget>.generate(
              boxes.length,
              (index) => boxes[index],
            ),
          ),
        ),
      ),
    );
  }
}
