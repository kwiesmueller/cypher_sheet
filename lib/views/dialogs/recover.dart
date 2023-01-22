import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/providers/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/number.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class RecoverPools extends ConsumerStatefulWidget {
  const RecoverPools({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecoverPoolsState();
}

class _RecoverPoolsState extends ConsumerState<RecoverPools> {
  int addIntellect = 0;
  int addSpeed = 0;
  int addMight = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: AppText(
            "Recover",
            align: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PoolStatusChip(
                  type: PoolType.might,
                  add: addMight,
                ),
              ),
              Expanded(
                child: PoolStatusChip(
                  type: PoolType.speed,
                  add: addSpeed,
                ),
              ),
              Expanded(
                child: PoolStatusChip(
                  type: PoolType.intellect,
                  add: addIntellect,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: AppBox(
            onTap: () {
              ref.read(characterProvider.notifier).resetAllPools();
              closeDialog(context);
            },
            padding: 8,
            child: const AppText("Reset all to Cap"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: RecoverNumberSelector(
                  onValueChange: (newValue) {
                    setState(() {
                      addMight = newValue;
                    });
                  },
                  stat: ref.watch(statProvider(PoolType.might)),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: RecoverNumberSelector(
                  onValueChange: (newValue) {
                    setState(() {
                      addSpeed = newValue;
                    });
                  },
                  stat: ref.watch(statProvider(PoolType.speed)),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: RecoverNumberSelector(
                  onValueChange: (newValue) {
                    setState(() {
                      addIntellect = newValue;
                    });
                  },
                  stat: ref.watch(statProvider(PoolType.intellect)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28.0),
        AppText(
          "Set how many points should be added to each pool and hit Recover",
          style: Theme.of(context).textTheme.labelLarge,
          align: TextAlign.left,
          maxLines: 3,
        ),
        const SizedBox(height: 28.0),
        AppBox(
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            ref.read(characterProvider.notifier).recoverAllPools(
                  addIntellect: addIntellect,
                  addSpeed: addSpeed,
                  addMight: addMight,
                );
            closeDialog(context);
          },
          child: AppText(
            () {
              final totalPoints = addIntellect + addSpeed + addMight;
              return "Recover $totalPoints point${totalPoints != 1 ? "s" : ""}";
            }(),
          ),
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

class PoolStatusChip extends ConsumerWidget {
  const PoolStatusChip({super.key, required this.type, required this.add});

  final PoolType type;
  final int add;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stat = ref.watch(statProvider(type));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: AppText(
            type.toLabel(),
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        AppBox(
          borderRadius: 20,
          padding: 6.0,
          child: AppText(
            "${stat.pool + add}/${stat.cap}",
          ),
        )
      ],
    );
  }
}

class RecoverNumberSelector extends StatelessWidget {
  const RecoverNumberSelector(
      {super.key, required this.onValueChange, required this.stat});

  final Stat stat;
  final Function(int) onValueChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: AppText(
            "Add",
            align: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100),
          child: AppBox(
            padding: 0,
            child: NumberSelectorList(
              controller:
                  PageController(initialPage: 0, viewportFraction: 0.38),
              lowestNumber: 0,
              highestNumber: () {
                final diff = stat.cap - stat.pool;
                if (diff < 0) {
                  return 0;
                }
                return diff;
              }(),
              onValueChange: onValueChange,
            ),
          ),
        ),
      ],
    );
  }
}
