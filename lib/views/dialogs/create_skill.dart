import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/selector.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class CreateSkill extends ConsumerStatefulWidget {
  const CreateSkill({
    super.key,
    this.uuid = "",
    this.name = "",
    this.description = "",
    this.type = PoolType.intellect,
    this.level = SkillLevel.trained,
  });

  CreateSkill.fromState(Skill skill, {super.key})
      : uuid = skill.uuid,
        name = skill.name,
        description = skill.description,
        type = skill.type,
        level = skill.level;

  final String uuid;
  final String name;
  final String description;
  final PoolType type;
  final SkillLevel level;

  @override
  ConsumerState<CreateSkill> createState() => _CreateAbilityState();
}

class _CreateAbilityState extends ConsumerState<CreateSkill> {
  late bool isNew;

  late TextEditingController name = TextEditingController();
  late TextEditingController description = TextEditingController();
  late PoolType type;
  late SkillLevel level;

  @override
  void initState() {
    super.initState();

    isNew = widget.uuid.isEmpty;
    name.text = widget.name;
    description.text = widget.description;
    type = widget.type;
    level = widget.level;
  }

  @override
  void dispose() {
    name.dispose();
    description.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                "${isNew ? "Create" : "Edit"} Skill",
                align: TextAlign.left,
              ),
              if (!isNew)
                AppBox(
                    flat: true,
                    padding: 2,
                    onTap: () {
                      showConfirmDialog(
                          context,
                          AppText(
                            "Permanently delete\n${name.value.text}",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelLarge,
                          ), () {
                        ref
                            .read(characterProvider.notifier)
                            .deleteSkill(widget.uuid);
                        closeDialog(context);
                        closeDialog(context);
                      });
                    },
                    child: const AppIcon(
                      AppIcons.deleteForever,
                      size: 24,
                    )),
            ],
          ),
        ),
        Expanded(
          child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
            DialogTextBox(
              controller: name,
              label: "Name",
              initialValue: name.value.text,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: AppText(
                        "Type",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        align: TextAlign.left,
                      ),
                    ),
                    poolTypeSelectors(),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: AppText(
                        "Level",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        align: TextAlign.left,
                      ),
                    ),
                    skillLevelSelectors(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: description,
              label: "Description",
              initialValue: description.text,
              multiLine: true,
            ),
          ]),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            final skill = Skill(
              uuid: widget.uuid,
              name: name.value.text,
              description: description.value.text,
              level: level,
              type: type,
            );
            if (isNew) {
              ref.read(characterProvider.notifier).addSkill(skill);
            } else {
              ref.read(characterProvider.notifier).updateSkill(skill);
            }
            closeDialog(context);
          }),
          color: Theme.of(context).colorScheme.primary,
          child: AppText(isNew ? "Create" : "Update"),
        ),
      ],
    );
  }

  Widget poolTypeSelectors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...PoolType.values.map(
          (selectorType) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: PoolTypeSelector(
                activeType: type,
                type: selectorType,
                onSelect: (newType) {
                  setState(() {
                    type = newType;
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget skillLevelSelectors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...SkillLevel.values.map(
          (selectorType) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SkillLevelSelector(
                activeLevel: level,
                type: selectorType,
                onSelect: (newLevel) {
                  setState(() {
                    level = newLevel;
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
