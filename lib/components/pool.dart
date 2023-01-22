import 'package:cypher_sheet/state/providers/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/stat.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/pool.dart';

class PoolView extends ConsumerWidget {
  const PoolView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoolBox(ref.watch(statProvider(PoolType.might))),
        PoolBox(ref.watch(statProvider(PoolType.speed))),
        PoolBox(ref.watch(statProvider(PoolType.intellect))),
      ],
    );
  }
}

class PoolBox extends ConsumerWidget {
  const PoolBox(this.stat, {super.key});

  final Stat stat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double size = 100.0;
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        showAppDialog(
          context,
          PoolEdit(stat.type),
        );
      },
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PoolLabel(stat.type.toLabel()),
            CenterPoolBox(stat.pool.toString()),
            SmallPoolBox(stat.cap.toString(), Alignment.topRight),
            SmallPoolBox(stat.edge.toString(), Alignment.bottomLeft),
          ],
        ),
      ),
    );
  }
}

class PoolLabel extends StatelessWidget {
  const PoolLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: AppText(
          text,
          align: TextAlign.left,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}

class CenterPoolBox extends StatelessWidget {
  const CenterPoolBox(this.text, {this.size = 75.0, super.key});

  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        child: StatBox(
          value: AppText(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class SmallPoolBox extends StatelessWidget {
  const SmallPoolBox(this.text, this.alignment, {this.size = 35.0, super.key});

  final double size;
  final Alignment alignment;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
          alignment: alignment,
          child: StatBox(
            value: AppText(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: 12,
            size: size,
          )),
    );
  }
}
