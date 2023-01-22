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

class CreateNote extends ConsumerStatefulWidget {
  const CreateNote({
    super.key,
    this.uuid = "",
    this.title = "",
    this.type = NoteType.misc,
    this.shortDescription = "",
    this.text = "",
  });

  CreateNote.fromState(Note note, {super.key})
      : uuid = note.uuid,
        title = note.title,
        type = note.type,
        shortDescription = note.shortDescription,
        text = note.text;

  final String uuid;
  final String title;
  final NoteType type;
  final String shortDescription;
  final String text;

  @override
  ConsumerState<CreateNote> createState() => _CreateAbilityState();
}

class _CreateAbilityState extends ConsumerState<CreateNote> {
  late bool isNew;

  late TextEditingController title = TextEditingController();
  late TextEditingController shortDescription = TextEditingController();
  late NoteType type;
  late TextEditingController text = TextEditingController();

  @override
  void initState() {
    super.initState();

    isNew = widget.uuid.isEmpty;
    title.text = widget.title;
    shortDescription.text = widget.shortDescription;
    type = widget.type;
    text.text = widget.text;
  }

  @override
  void dispose() {
    title.dispose();
    shortDescription.dispose();
    text.dispose();

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
                "${isNew ? "Create" : "Edit"} Note",
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
                            "Permanently delete\n${title.value.text}",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelLarge,
                          ), () {
                        ref
                            .read(characterProvider.notifier)
                            .deleteNote(widget.uuid);
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
              controller: title,
              label: "Title",
              initialValue: title.value.text,
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: shortDescription,
              label: "Short Description",
              initialValue: shortDescription.value.text,
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
              controller: text,
              label: "Text",
              initialValue: text.text,
              multiLine: true,
            ),
          ]),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            final note = Note(
              uuid: widget.uuid,
              title: title.value.text,
              shortDescription: shortDescription.value.text,
              type: type,
              text: text.value.text,
            );
            if (isNew) {
              ref.read(characterProvider.notifier).addNote(note);
            } else {
              ref.read(characterProvider.notifier).updateNote(note);
            }
            closeDialog(context);
          }),
          color: Theme.of(context).colorScheme.primary,
          child: AppText(isNew ? "Create" : "Update"),
        ),
      ],
    );
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
}
