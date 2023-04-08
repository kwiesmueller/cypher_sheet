import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/selector.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/note/editable.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class NoteEditInputs extends StatelessWidget {
  const NoteEditInputs(this.edit, this.setState, {super.key});

  final EditableNote edit;
  final Function(Function()) setState;

  @override
  Widget build(BuildContext context) {
    return AppScrollView(customPadding: EdgeInsets.zero, slivers: [
      DialogTextBox(
        controller: edit.title,
        label: "Title",
        initialValue: edit.title.value.text,
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.shortDescription,
        label: "Short Description",
        initialValue: edit.shortDescription.value.text,
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
              "Type",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              align: TextAlign.left,
            ),
          ),
          noteTypeSelectors(),
        ],
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.text,
        label: "Text",
        initialValue: edit.text.text,
        multiLine: true,
      ),
    ]);
  }

  Widget noteTypeSelectors() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...NoteType.values.map(
          (selectorType) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: NoteTypeSelector(
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
