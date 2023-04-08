import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareObjectButton extends StatelessWidget {
  const ShareObjectButton(this.getFile, {super.key});

  final Future<XFile> Function() getFile;

  @override
  Widget build(BuildContext context) {
    return SVGBox(
      padding: 12,
      onTap: (() async {
        final file = await getFile();

        Share.shareXFiles(subject: file.name, [
          file,
        ]);
      }),
      icon: AppIcons.share,
    );
  }
}
