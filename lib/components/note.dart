import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/extensions/note.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/notes.dart';
import 'package:cypher_sheet/views/dialogs/create_note.dart';
import 'package:cypher_sheet/views/dialogs/view_note.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteListItem extends ConsumerWidget {
  const NoteListItem({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(noteProvider(uuid));

    return AppBox(
      padding: 12,
      borderRadius: 12,
      onTap: () {
        showAppDialog(context, ViewNote(uuid: uuid));
      },
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
                  note.type.toIcon(),
                  size: 28,
                ),
              ),
              Expanded(
                child: NoteTitleText(title: note.title),
              ),
              SVGBox(
                  icon: AppIcons.edit,
                  padding: 4,
                  size: 24,
                  onTap: () {
                    showAppDialog(context, CreateNote.fromState(note));
                  }),
            ],
          ),
          if (note.shortDescription.isNotEmpty)
            NoteShortDescriptionText(description: note.shortDescription),
        ],
      ),
    );
  }
}

class NoteShortDescriptionText extends StatelessWidget {
  const NoteShortDescriptionText({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Text(
        description,
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.start,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class NoteTypeIcon extends StatelessWidget {
  const NoteTypeIcon({
    Key? key,
    required this.type,
  }) : super(key: key);

  final NoteType type;

  @override
  Widget build(BuildContext context) {
    return SVGBox(icon: type.toIcon());
  }
}

class NoteTitleText extends StatelessWidget {
  const NoteTitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(title,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
          textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: true,
              applyHeightToLastDescent: false,
              leadingDistribution: TextLeadingDistribution.even)),
    );
  }
}
