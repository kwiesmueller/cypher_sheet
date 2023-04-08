import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/selector.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/editable.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class AbilityEditInputs extends StatelessWidget {
  const AbilityEditInputs(this.edit, this.setState, {super.key});

  final EditableAbility edit;
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const SizedBox(
            width: 0.0,
          ),
          Expanded(
            child: DialogTextBox(
              controller: edit.cost,
              label: "Cost",
              initialValue: edit.cost.value.text,
            ),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppCheckbox(
            active: edit.enabler,
            onTap: () {
              setState(() {
                edit.enabler = !edit.enabler;
              });
            },
          ),
          const SizedBox(width: 16.0),
          AppText(
            "Enabler",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            align: TextAlign.left,
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.shortDescription,
        label: "Short Description",
        initialValue: edit.shortDescription.text,
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
}
