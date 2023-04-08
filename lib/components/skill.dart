import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/extensions/skill.dart';
import 'package:cypher_sheet/state/providers/skills.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/view.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillListItem extends ConsumerWidget {
  const SkillListItem(this.uuid, {super.key});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skill = ref.watch(skillProvider(uuid));
    return AppBox(
      borderRadius: 12,
      padding: 8,
      onTap: () {
        showAppDialog(context, ViewSkill(uuid: uuid));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: AppIcon(
                skill.type.toIcon(),
                size: 28,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: AppText(
                skill.name,
                style: Theme.of(context).textTheme.bodyMedium,
                align: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: AppIcon(
                skill.level.toIcon(),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
