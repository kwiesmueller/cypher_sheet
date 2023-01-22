import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/text.dart';

const double defaultStatBoxSize = 75.0;

class SimpleStatBox extends ConsumerWidget {
  const SimpleStatBox({
    required this.type,
    required this.value,
    this.onTap,
    super.key,
  });

  final String type;
  final num value;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatBox(
      type: type,
      value: AppText(
        value.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: onTap,
    );
  }
}

class StatBox extends ConsumerWidget {
  const StatBox({
    required this.value,
    super.key,
    this.size = defaultStatBoxSize,
    this.type,
    this.backgroundColor,
    this.borderRadius = 20.0,
    this.alignChild,
    this.onTap,
    this.flat = false,
  });

  final String? type;
  final Widget value;
  final double size;
  final Color? backgroundColor;
  final double borderRadius;
  final AlignmentGeometry? alignChild;
  final Function()? onTap;
  final bool flat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBox(
      constraints: BoxConstraints.loose(Size.square(size)),
      onTap: onTap,
      borderRadius: borderRadius,
      color: backgroundColor,
      padding: 0,
      flat: flat,
      child: Stack(
        children: [
          Padding(
            padding: type != null
                ? const EdgeInsets.only(top: 6.0)
                : const EdgeInsets.only(),
            child: Container(
              alignment: alignChild ??
                  (type != null ? Alignment.topCenter : Alignment.center),
              child: value,
            ),
          ),
          if (type != null) StatBoxLabel(type!),
        ],
      ),
    );
  }
}

class StatBoxLabel extends StatelessWidget {
  const StatBoxLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: AppText(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
