import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/providers/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class PoolEdit extends ConsumerWidget {
  const PoolEdit(this.pool, {super.key});

  final PoolType pool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AppText(
            pool.toLabel(),
            align: TextAlign.left,
          ),
        ),
        Expanded(
            child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: AppTextEdit(
                    textInputType: TextInputType.number,
                    label: "Cap",
                    value: ref.watch(statProvider(pool)).cap.toString(),
                    onEditingComplete: (value) {
                      ref
                          .read(characterProvider.notifier)
                          .editCap(pool, int.tryParse(value) ?? 0);
                    },
                  ),
                ),
                const SizedBox(width: 28.0),
                Expanded(
                  child: AppTextEdit(
                    textInputType: TextInputType.number,
                    label: "Edge",
                    value: ref.watch(statProvider(pool)).edge.toString(),
                    onEditingComplete: (value) {
                      ref
                          .read(characterProvider.notifier)
                          .editEdge(pool, int.tryParse(value) ?? 0);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AppText(
              "Pool",
              align: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AppTextEdit(
              textInputType: TextInputType.number,
              value: ref
                  .watch(statProvider(pool).select((value) => value.pool))
                  .toString(),
              onEditingComplete: (value) {
                ref
                    .read(characterProvider.notifier)
                    .editPool(pool, int.tryParse(value) ?? 0);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromHeight(200)),
              child: PoolNumberSelector(
                pool: pool,
              ),
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

class PoolNumberSelector extends ConsumerWidget {
  const PoolNumberSelector({super.key, required this.pool});

  final PoolType pool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NumberSelector(
      add: (value) {
        ref.read(characterProvider.notifier).addToPool(pool, value);
      },
      remove: (value) {
        ref.read(characterProvider.notifier).addToPool(pool, value);
      },
    );
  }
}
