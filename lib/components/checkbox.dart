import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox(
      {super.key,
      this.active = false,
      this.size = 30.0,
      this.borderRadius = 8.0,
      this.onTap});

  final bool active;
  final double size;
  final double borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: BoxConstraints.loose(Size.square(size)),
      child: AspectRatio(
        aspectRatio: 1,
        child: AppBox(
          onTap: onTap,
          active: active,
          borderRadius: 8.0,
          color: active ? colorScheme.primary : colorScheme.surfaceVariant,
          child: const SizedBox(),
        ),
      ),
    );
  }
}
