import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/extensions/shared_object.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ShareObject extends ConsumerWidget {
  const ShareObject({super.key, required this.obj, this.deleteAfterwards});

  final SharedObject obj;
  final Function()? deleteAfterwards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          "Share ${obj.printableType()}",
          style: Theme.of(context).textTheme.bodyLarge,
          align: TextAlign.left,
        ),
        const SizedBox(height: 28.0),
        AppBox(
          onTap: () async {
            Share.shareXFiles([
              await obj.toFile(),
            ]);
          },
          child: AppText(
            "Share ${obj.printableType()}",
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
