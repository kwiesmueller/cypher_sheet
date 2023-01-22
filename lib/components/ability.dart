import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/state/providers/abilities.dart';
import 'package:cypher_sheet/views/dialogs/view_ability.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AbilityListItem extends ConsumerWidget {
  const AbilityListItem(this.uuid, {super.key});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ability = ref.watch(abilityProvider(uuid));
    return AppBox(
      onTap: () {
        showAppDialog(context, ViewAbility(uuid: uuid));
      },
      borderRadius: 12,
      padding: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: AppIcon(
                    ability.type.toIcon(),
                    size: 28,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(ability.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: true,
                            applyHeightToLastDescent: false,
                            leadingDistribution: TextLeadingDistribution.even)),
                  ),
                ),
                if (ability.cost.isNotEmpty)
                  Container(
                    decoration: appBoxDecoration(
                      context,
                      borderRadius: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: AppText(ability.cost,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(letterSpacing: -1),
                          align: TextAlign.center),
                    ),
                  ),
              ],
            ),
            if (ability.shortDescription.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Text(
                  ability.shortDescription,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
