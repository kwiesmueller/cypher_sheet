import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/markdown.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/extensions/note.dart';
import 'package:cypher_sheet/extensions/shared_object.dart';
import 'package:cypher_sheet/state/providers/notes.dart';
import 'package:cypher_sheet/views/dialogs/object/base/view.dart';
import 'package:cypher_sheet/views/dialogs/object/note/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class ViewNote extends ConsumerWidget {
  const ViewNote({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(noteProvider(uuid));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppText(
                  note.title,
                  align: TextAlign.left,
                ),
              ),
              AppBox(
                  flat: true,
                  padding: 2,
                  onTap: () {
                    showAppDialog(
                      context,
                      UpdateNote(note),
                      fullscreen: true,
                    );
                  },
                  child: const AppIcon(
                    AppIcons.edit,
                    size: 24,
                  )),
            ],
          ),
        ),
        Expanded(
          child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 40,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SVGBoxLabeled(
                    icon: note.type.toIcon(),
                    label: note.type.toLabel(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            if (note.shortDescription.isNotEmpty)
              const AppLabel(text: "Short Description"),
            if (note.shortDescription.isNotEmpty)
              AppMarkdown(data: note.shortDescription),
            const SizedBox(height: 16.0),
            if (note.text.isNotEmpty) const AppLabel(text: "Text"),
            if (note.text.isNotEmpty) AppMarkdown(data: note.text),
          ]),
        ),
        const SizedBox(height: 16.0),
        ObjectActionButtons(
          getShareable: () => note.share().toFile(),
          buildUpdateDialog: () => UpdateNote(note),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            closeDialog(context);
          }),
          child: const AppText("Close"),
        ),
      ],
    );
  }
}
