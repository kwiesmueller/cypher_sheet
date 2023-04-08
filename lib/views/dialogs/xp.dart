import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class XPEdit extends ConsumerWidget {
  const XPEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: AppText(
            "Experience",
            align: TextAlign.left,
          ),
        ),
        Expanded(
            child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: AppTextEdit(
                    label: "Free XP",
                    value: ref.watch(progressProvider).freeXp.toString(),
                    textInputType: TextInputType.number,
                    onEditingComplete: (newValue) {
                      ref
                          .read(characterProvider.notifier)
                          .editFreeXP(int.tryParse(newValue) ?? 0);
                    },
                  ),
                ),
                const SizedBox(width: 28.0),
                Expanded(
                  child: AppTextEdit(
                    label: "Total XP",
                    value: ref.watch(progressProvider).totalXp.toString(),
                    textInputType: TextInputType.number,
                    onEditingComplete: (newValue) {
                      ref
                          .read(characterProvider.notifier)
                          .editTotalXP(int.tryParse(newValue) ?? 0);
                    },
                  ),
                ),
              ],
            ),
          ),
          XPGainer(
            gainXP: (add) {
              ref.read(characterProvider.notifier).addXP(add);
              closeDialog(context);
            },
            spendXP: (spend) {
              ref.read(characterProvider.notifier).spendXP(spend);
              closeDialog(context);
            },
          ),
        ])),
        const SizedBox(height: 28.0),
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

class XPGainer extends StatefulWidget {
  const XPGainer({super.key, required this.gainXP, required this.spendXP});

  final Function(int add) gainXP;
  final Function(int spend) spendXP;

  @override
  State<XPGainer> createState() => _XPGainerState();
}

class _XPGainerState extends State<XPGainer> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        AppBox(
          color: Theme.of(context).colorScheme.error,
          onTap: () {
            widget.spendXP((int.tryParse(controller.value.text) ?? 0));
          },
          child: const AppText("Spend"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: AppTextEdit(
            value: "1",
            textInputType: TextInputType.number,
            onEditingComplete: (newValue) {},
            controller: controller,
          ),
        ),
        AppBox(
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            widget.gainXP(int.tryParse(controller.value.text) ?? 0);
          },
          child: const AppText("Gain"),
        ),
      ],
    );
  }
}
