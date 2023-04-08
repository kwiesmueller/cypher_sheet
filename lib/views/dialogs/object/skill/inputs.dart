import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/selector.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/editable.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class SkillEditInputs extends StatelessWidget {
  const SkillEditInputs(this.edit, this.setState, {super.key});

  final EditableSkill edit;
  final Function(Function()) setState;

  @override
  Widget build(BuildContext context) {
    return AppScrollView(customPadding: EdgeInsets.zero, slivers: [
      DialogTextBox(
        controller: edit.name,
        label: "Name",
        initialValue: edit.name.value.text,
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
        controller: edit.description,
        label: "Description",
        initialValue: edit.description.text,
        multiLine: true,
      ),
    ]);
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
                activeType: edit.type,
                type: selectorType,
                onSelect: (newType) {
                  setState(() {
                    edit.type = newType;
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
                activeLevel: edit.level,
                type: selectorType,
                onSelect: (newLevel) {
                  setState(() {
                    edit.level = newLevel;
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
