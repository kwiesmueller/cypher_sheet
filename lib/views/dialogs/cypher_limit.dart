import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';

class CypherLimitEdit extends ConsumerWidget {
  const CypherLimitEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NumberEdit(
          label: "Cypher Limit",
          initialValue: ref.watch(characterProvider).cypherLimit,
          onEditingComplete: (newValue) {
            ref.read(characterProvider.notifier).editCypherLimit(newValue);
            closeDialog(context);
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
