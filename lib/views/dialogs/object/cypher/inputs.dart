import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/editable.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class CypherEditInputs extends StatelessWidget {
  const CypherEditInputs(this.edit, this.setState, {super.key});

  final EditableCypher edit;
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
      DialogTextBox(
        controller: edit.shortDescription,
        label: "Short Description",
        initialValue: edit.shortDescription.text,
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                constraints: const BoxConstraints.tightFor(width: 64),
                child: DialogTextBox(
                  controller: edit.level,
                  label: "Level",
                  initialValue: edit.level.value.text,
                ),
              ),
            ),
          ),
          Expanded(
            child: DialogTextBox(
              controller: edit.depletion,
              label: "Depletion",
              initialValue: edit.depletion.value.text,
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
            active: edit.active,
            onTap: () {
              setState(() {
                edit.active = !edit.active;
              });
            },
          ),
          const SizedBox(width: 16.0),
          AppText(
            "Active",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            align: TextAlign.left,
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.internal,
        label: "Internal",
        initialValue: edit.internal.text,
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.wearable,
        label: "Wearable",
        initialValue: edit.wearable.text,
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.usable,
        label: "Usable",
        initialValue: edit.usable.text,
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.effect,
        label: "Effect",
        initialValue: edit.effect.text,
        multiLine: true,
      ),
    ]);
  }
}
