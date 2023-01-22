import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/views/dialogs/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/state/storage/file.dart';
import 'package:cypher_sheet/testdata.dart';

class DevCharacterList extends ConsumerWidget {
  const DevCharacterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AppText(
            "Developer Tools",
            align: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        AppBox(
          onTap: () async {
            writeInitialCharacterRevision(finch);
            ref.invalidate(characterListProvider);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: AppText("Add Test Data"),
          ),
        ),
        const SizedBox(height: 28.0),
        AppBox(
          onTap: () {
            showAppDialog(context, const ImportCharacter());
          },
          child: const AppText("Import Character"),
        ),
        const SizedBox(height: 28.0),
        AppBox(
          onTap: () {
            showAppDialog(
                context,
                const Scaffold(
                  body: LicensePage(),
                ));
          },
          child: const AppText("Show Licenses"),
        ),
        const Spacer(),
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
