import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/spacer.dart';
import 'package:cypher_sheet/components/stat.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/recover.dart';
import 'package:cypher_sheet/views/dialogs/recovery_bonus.dart';

class RecoveryView extends ConsumerWidget {
  const RecoveryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recoveries = ref.watch(recoveryProvider);
    return AppBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RecoveryStats(recoveries),
          const AppSpacer(),
          RecoveryCheckboxes(recoveries),
        ],
      ),
    );
  }
}

class RecoveryStats extends ConsumerWidget {
  const RecoveryStats(this.recovery, {super.key});

  final Recovery recovery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const RecoverySimpleStatBox("1d6", flat: true),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
          child: AppText(
            "+",
            maxLines: 1,
          ),
        ),
        RecoverySimpleStatBox(recovery.bonus.toString(), onTap: () {
          showAppDialog(
            context,
            const RecoveryBonusEdit(),
          );
        }),
        const Spacer(),
        RecoveryIconStatBox(
          Icons.self_improvement,
          onTap: () {
            showAppDialog(context, const RecoverPools());
          },
        )
      ],
    );
  }
}

class RecoveryCheckboxes extends ConsumerWidget {
  const RecoveryCheckboxes(this.recovery, {super.key});

  final Recovery recovery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecoveryCheckboxWithLabel(
                "1 Action", recovery.oneAction, Recover.one_action),
            const AppSpacer(),
            RecoveryCheckboxWithLabel(
                "10 Minutes", recovery.tenMinutes, Recover.ten_minutes),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecoveryCheckboxWithLabel(
                "1 Hour", recovery.oneHour, Recover.one_hour),
            const AppSpacer(),
            RecoveryCheckboxWithLabel(
                "10 Hours", recovery.tenHours, Recover.ten_hours),
          ],
        ),
      ],
    );
  }
}

class RecoverySimpleStatBox extends ConsumerWidget {
  const RecoverySimpleStatBox(this.value,
      {super.key, this.onTap, this.flat = false});

  final String value;
  final Function()? onTap;
  final bool flat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const fontSize = 28.0;

    return RecoveryStatBox(
      AppText(
        value,
        style:
            Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: fontSize),
      ),
      onTap: onTap,
      flat: flat,
    );
  }
}

class RecoveryIconStatBox extends ConsumerWidget {
  const RecoveryIconStatBox(this.icon, {super.key, this.color, this.onTap});

  final IconData icon;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 40.0;

    return RecoveryStatBox(
      AppIcon(
        AppIcons.recovery,
        size: size,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
      onTap: onTap,
    );
  }
}

class RecoveryStatBox extends ConsumerWidget {
  const RecoveryStatBox(this.value, {super.key, this.onTap, this.flat = false});

  final Widget value;
  final Function()? onTap;
  final bool flat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 55.0;
    const borderRadius = 10.0;

    return StatBox(
      value: value,
      size: size,
      borderRadius: borderRadius,
      backgroundColor:
          flat ? null : Theme.of(context).colorScheme.surfaceVariant,
      onTap: onTap,
      flat: flat,
    );
  }
}

class RecoveryCheckboxWithLabel extends ConsumerWidget {
  const RecoveryCheckboxWithLabel(this.label, this.active, this.recover,
      {super.key, this.spacer});

  final String label;
  final bool active;
  final Widget? spacer;
  final Recover recover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onTap() {
      ref.read(characterProvider.notifier).toggleRecovery(recover);
      if (!active) {
        showAppDialog(context, const RecoverPools());
      }
    }

    return AppBox(
      flat: true,
      padding: 0,
      onTapGesture: onTap,
      child: Row(
        children: [
          AppCheckbox(
            onTap: onTap,
            active: active,
            borderRadius: 8.0,
          ),
          spacer ?? const AppSpacer(),
          AppText(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
