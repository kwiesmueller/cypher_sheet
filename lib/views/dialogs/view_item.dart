import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/markdown.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/state/providers/items.dart';
import 'package:cypher_sheet/views/dialogs/create_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';

class ViewItem extends ConsumerWidget {
  const ViewItem({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(uuid));

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
                  item.name,
                  align: TextAlign.left,
                ),
              ),
              AppBox(
                  flat: true,
                  padding: 2,
                  onTap: () {
                    showAppDialog(
                      context,
                      CreateItem.fromState(item),
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
        if (item.shortDescription.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AppText(
              item.shortDescription,
              style: Theme.of(context).textTheme.bodySmall,
              align: TextAlign.left,
              maxLines: 3,
            ),
          ),
        Expanded(
          child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
            const SizedBox(height: 16.0),
            if (item.description.isNotEmpty)
              const AppLabel(text: "Description"),
            if (item.description.isNotEmpty)
              AppMarkdown(data: item.description),
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
