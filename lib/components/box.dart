import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:flutter/material.dart';

class AppBox extends StatelessWidget {
  const AppBox({
    super.key,
    this.active = false,
    required this.child,
    this.padding = 16.0,
    this.customPadding,
    this.borderRadius,
    this.fit,
    this.onTap,
    this.onTapGesture,
    this.flat = false,
    this.color,
    this.constraints,
  });

  final Widget child;
  final bool active;
  final double padding;
  final EdgeInsetsGeometry? customPadding;
  final double? borderRadius;
  final BoxFit? fit;
  final void Function()? onTap;
  final void Function()? onTapGesture;
  final bool flat;
  final Color? color;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final paddedChild = Padding(
      padding: customPadding ?? EdgeInsets.all(padding),
      child: fit != null
          ? FittedBox(
              fit: fit!,
              alignment: Alignment.centerLeft,
              child: child,
            )
          : child,
    );

    final boxBorderRadius = BorderRadius.circular(borderRadius ?? 12);

    late Color boxColor;
    if (color != null) {
      boxColor = color!;
    } else if (active) {
      boxColor = Theme.of(context).colorScheme.primary;
    } else if (flat) {
      boxColor = Colors.transparent;
    } else {
      boxColor = Theme.of(context).colorScheme.surface;
    }

    final decoration = appBoxDecoration(
      context,
      customBorderRadius: boxBorderRadius,
      color: boxColor,
    );

    return Container(
      constraints: constraints,
      decoration: decoration,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: boxBorderRadius,
        child: onTap != null
            ? InkWell(
                borderRadius: boxBorderRadius,
                onTap: onTap,
                child: paddedChild,
              )
            : onTapGesture != null
                ? GestureDetector(
                    onTap: onTapGesture!,
                    child: paddedChild,
                  )
                : paddedChild,
      ),
    );
  }
}

class LabeledAppBox extends StatelessWidget {
  const LabeledAppBox({
    super.key,
    required this.label,
    required this.value,
    this.flat = false,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final bool flat;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabel(text: label),
        AppBox(
          flat: flat,
          customPadding: flat
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 4, horizontal: 10.0),
          child: AppText(
            value,
            style: flat
                ? Theme.of(context).textTheme.labelLarge
                : Theme.of(context).textTheme.bodyMedium,
            align: TextAlign.left,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}

Decoration appBoxDecoration(
  BuildContext context, {
  double borderRadius = 20.0,
  Color? color,
  BorderRadiusGeometry? customBorderRadius,
}) {
  return BoxDecoration(
    color: color ?? Theme.of(context).colorScheme.surface,
    borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
  );
}
