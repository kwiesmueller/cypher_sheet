import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({
    super.key,
    this.text = "",
    this.alignment = Alignment.center,
    this.rightOnTap,
  });

  final String text;
  final Alignment alignment;
  final Function()? rightOnTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Container(
          decoration: appBoxDecoration(context),
          height: 3,
        ),
        if (text.isNotEmpty)
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: alignment == Alignment.center
                  ? const EdgeInsets.symmetric(horizontal: 8.0)
                  : const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: alignment == Alignment.center
                        ? const EdgeInsets.symmetric(horizontal: 8.0)
                        : const EdgeInsets.only(right: 8.0),
                    child: AppText(
                      text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (rightOnTap != null)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
                child: AppBox(
                  onTap: rightOnTap,
                  flat: true,
                  padding: 0,
                  child: const AppIcon(
                    AppIcons.add,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
