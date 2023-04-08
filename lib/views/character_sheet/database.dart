import 'dart:io';

import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/extensions/shared_object.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/appbar.dart' as app;
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/text.dart';

class DatabaseView extends ConsumerWidget {
  const DatabaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScrollView(
      appBar: const app.AppBar(
          child: AppText(
        "Database",
        align: TextAlign.left,
      )),
      slivers: [
        Row(
          children: [
            const Spacer(),
            SVGBoxLabeled(
              icon: AppIcons.import,
              label: "Import",
              onTap: () async {
                final obj = await importObjectFromPicker();
                if (obj == null) {
                  return;
                }
                // ignore: use_build_context_synchronously
                if (!context.mounted) return;
                showAppDialog(context, obj.importDialog());
              },
            ),
          ],
        )
      ],
    );
  }

  Future<SharedObject?> importObjectFromPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      final obj = SharedObject.fromBuffer(file.readAsBytesSync());
      return obj;
    }
    return null;
  }
}
