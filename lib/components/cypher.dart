import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/extensions/cypher.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/cyphers.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/view.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/view.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CypherListItem extends ConsumerWidget {
  const CypherListItem({
    super.key,
    required this.uuid,
    required this.type,
  });

  final String uuid;
  final CypherType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String name;
    late String level;
    late String shortDescription;

    if (type == CypherType.cypher) {
      final cypher = ref.watch(cypherProvider(uuid));
      name = cypher.name;
      level = cypher.level;
      shortDescription = cypher.shortDescription;
    } else {
      final cypher = ref.watch(artifactProvider(uuid));
      name = cypher.name;
      level = cypher.level;
      shortDescription = cypher.shortDescription;
    }

    return AppBox(
      padding: 12,
      borderRadius: 12,
      onTap: () {
        if (type == CypherType.cypher) {
          showAppDialog(
            context,
            ViewCypher(uuid: uuid),
            fullscreen: true,
          );
        } else {
          showAppDialog(
            context,
            ViewArtifact(uuid: uuid),
            fullscreen: true,
          );
        }
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
                  type.toIcon(),
                  size: 28,
                ),
              ),
              Expanded(
                child: CypherNameText(name: name),
              ),
              if (level.isNotEmpty) CypherLevelText(level: level),
            ],
          ),
          if (shortDescription.isNotEmpty)
            CypherShortDescriptionText(description: shortDescription),
        ],
      ),
    );
  }
}

class CypherShortDescriptionText extends StatelessWidget {
  const CypherShortDescriptionText({
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

class CypherLevelText extends StatelessWidget {
  const CypherLevelText({
    Key? key,
    required this.level,
  }) : super(key: key);

  final String level;

  @override
  Widget build(BuildContext context) {
    return AppBox(
      borderRadius: 8,
      customPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: AppText(level,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(letterSpacing: -1),
          align: TextAlign.center),
    );
  }
}

class CypherNameText extends StatelessWidget {
  const CypherNameText({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(name,
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
