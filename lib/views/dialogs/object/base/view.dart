import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/share.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ObjectActionButtons extends StatelessWidget {
  const ObjectActionButtons({
    super.key,
    required this.getShareable,
    required this.buildUpdateDialog,
  });

  final Future<XFile> Function()? getShareable;
  final Widget Function() buildUpdateDialog;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (getShareable != null) ShareObjectButton(getShareable!),
        const SizedBox(width: 16.0),
        SVGBox(
          padding: 12,
          onTap: (() {
            showAppDialog(
              context,
              buildUpdateDialog(),
              fullscreen: true,
            );
          }),
          icon: AppIcons.edit,
        ),
      ],
    );
  }
}
