import 'package:cypher_sheet/components/equipment.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';

class MoneyEdit extends ConsumerWidget {
  const MoneyEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final money = ref.watch(characterProvider.select((value) => value.money));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 28.0),
          child: AppText(
            "Edit Money",
            align: TextAlign.left,
          ),
        ),
        Expanded(
            child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AppTextEdit(
              textInputType: TextInputType.number,
              value: removeZeroDecimals(ref.watch(
                  characterProvider.select((value) => value.money))).toString(),
              onEditingComplete: (value) {
                ref
                    .read(characterProvider.notifier)
                    .editMoney(double.tryParse(value) ?? money);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromHeight(200)),
              child: const MoneyNumberSelector(),
            ),
          ),
        ])),
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

class MoneyNumberSelector extends ConsumerWidget {
  const MoneyNumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NumberSelector(
      add: (value) {
        ref.read(characterProvider.notifier).addMoney(value.toDouble());
      },
      remove: (value) {
        ref.read(characterProvider.notifier).addMoney(value.toDouble());
      },
    );
  }
}
