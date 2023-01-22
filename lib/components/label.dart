import 'package:cypher_sheet/components/text.dart';
import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({super.key, required this.text, this.paddingBottom = 8.0});

  final String text;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: AppText(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
        align: TextAlign.left,
      ),
    );
  }
}
