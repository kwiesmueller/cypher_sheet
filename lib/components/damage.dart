import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/spacer.dart';
import 'package:cypher_sheet/components/text.dart';

class DamageTrackView extends ConsumerWidget {
  const DamageTrackView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final damage = ref.watch(damageProvider);

    return AppBox(
        child: Wrap(
      runSpacing: 16.0,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.spaceBetween,
      spacing: 8.0,
      children: [
        DamageTrack(
            "Impaired",
            const [
              "+ 1 Effort per level",
              "Ignore minor and major results on rolls",
              "Combat roll of 17-20 deal only +1 damage"
            ],
            damage.impaired, () {
          ref.read(characterProvider.notifier).toggleDamageImpaired();
        }),
        DamageTrack(
            "Debilitated",
            const [
              "Can move only an immediate distance",
              "Cannot move if Speed Pool is 0",
            ],
            damage.debilitated, () {
          ref.read(characterProvider.notifier).toggleDamageDebilitated();
        })
      ],
    ));
  }
}

class DamageTrack extends ConsumerWidget {
  const DamageTrack(this.name, this.description, this.active, this.onTap,
      {super.key});

  final String name;
  final List<String> description;
  final bool active;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var descriptionParagraphs = <Widget>[];

    for (var i = 0; i < description.length; i++) {
      descriptionParagraphs.add(Text(
        description[i],
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.start,
        maxLines: 10,
        softWrap: true,
        overflow: TextOverflow.clip,
      ));
      if (i < description.length - 1) {
        descriptionParagraphs.add(const SizedBox(
          height: 8.0,
        ));
      }
    }

    const checkboxSize = 28.0;

    final screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = 180.0;

    // Magic to make the description text use the full width on smaller screens
    if ((screenWidth / 2) - (3 * 16 /*approx padding*/) < maxWidth) {
      maxWidth = screenWidth;
    }

    return AppBox(
      flat: true,
      padding: 0,
      onTapGesture: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.loose(Size.fromWidth(maxWidth)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCheckbox(
                  onTap: onTap,
                  active: active,
                  // size: 28.0,
                  borderRadius: 8.0,
                ),
                const AppSpacer(),
                AppText(
                  name,
                  style: Theme.of(context).textTheme.labelLarge,
                  align: TextAlign.start,
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.loose(Size.fromWidth(maxWidth)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints.loose(Size.fromWidth(maxWidth)),
                    child: const SizedBox.square(dimension: checkboxSize)),
                const AppSpacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: descriptionParagraphs,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
