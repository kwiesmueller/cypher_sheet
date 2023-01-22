import 'dart:developer';

import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';

class TierEdit extends ConsumerWidget {
  const TierEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTier = ref.watch(progressProvider).tier;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NumberEdit(
          label: "Tier",
          initialValue: currentTier,
          onEditingComplete: (newValue) {
            log("editing complete");

            ref.read(characterProvider.notifier).editTier(newValue);
            if (newValue > currentTier) {
              ref
                  .read(characterProvider.notifier)
                  .addRecoveryBonus(newValue - currentTier);
            }
            if (Navigator.of(context).canPop()) {
              closeDialog(context);
            }
          },
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
