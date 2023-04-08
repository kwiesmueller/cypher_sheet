import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/appbar.dart';
import 'package:cypher_sheet/components/damage.dart';
import 'package:cypher_sheet/components/pool.dart';
import 'package:cypher_sheet/components/progress.dart';
import 'package:cypher_sheet/components/recovery.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/spacer.dart';

class StatsView extends ConsumerWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgets = [
      const ProgressView(),
      const AppSpacer(minHeight: 35),
      const PoolView(),
      const AppSpacer(minHeight: 35),
      const RecoveryView(),
      const AppSpacer(minHeight: 35),
      const DamageTrackView(),
    ];

    return AppScrollView(
      appBar: const CharacterSheetAppBar(),
      slivers: widgets,
    );
  }
}
