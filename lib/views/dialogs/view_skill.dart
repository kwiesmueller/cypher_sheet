import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/markdown.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/extensions/skill.dart';
import 'package:cypher_sheet/state/providers/skills.dart';
import 'package:cypher_sheet/views/dialogs/create_skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class ViewSkill extends ConsumerWidget {
  const ViewSkill({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skill = ref.watch(skillProvider(uuid));

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
                  skill.name,
                  align: TextAlign.left,
                ),
              ),
              AppBox(
                  flat: true,
                  padding: 2,
                  onTap: () {
                    showAppDialog(
                      context,
                      CreateSkill.fromState(skill),
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
            Row(
              children: [
                SVGBoxLabeled(
                  icon: skill.type.toIcon(),
                  label: skill.type.toLabel(),
                ),
                const SizedBox(width: 8.0),
                // const Spacer(),
                SVGBoxLabeled(
                  icon: skill.level.toIcon(),
                  label: skill.level.toLabel(),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (skill.description.isNotEmpty)
              const AppLabel(text: "Description"),
            if (skill.description.isNotEmpty)
              AppMarkdown(data: skill.description),
          ]),
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
