import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/components/icons.dart';

class SVGBoxLabeled extends StatelessWidget {
  const SVGBoxLabeled({
    super.key,
    this.active = false,
    required this.icon,
    required this.label,
    this.customLabelStyle,
    this.iconSize = 30,
    this.onTap,
    this.flat = false,
    this.padding = 8.0,
    this.customPadding,
  });

  final bool active;
  final AppIcons icon;
  final String label;
  final TextStyle? customLabelStyle;
  final double iconSize;
  final Function()? onTap;
  final bool flat;
  final double padding;
  final EdgeInsets? customPadding;

  @override
  Widget build(BuildContext context) {
    return AppBox(
      active: active,
      fit: BoxFit.contain,
      padding: padding,
      customPadding: customPadding,
      onTap: onTap,
      flat: flat,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon(
            icon,
            size: iconSize,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppText(
              label,
              style: customLabelStyle ?? Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class SVGBox extends StatelessWidget {
  const SVGBox({
    super.key,
    this.active = false,
    required this.icon,
    this.padding = 8.0,
    this.size = 30,
    this.borderRadius,
    this.onTap,
    this.flat = false,
  });

  final bool active;
  final AppIcons icon;
  final double padding;
  final double size;
  final double? borderRadius;
  final Function()? onTap;
  final bool flat;

  @override
  Widget build(BuildContext context) {
    return AppBox(
      active: active,
      fit: BoxFit.contain,
      padding: padding,
      borderRadius: borderRadius,
      flat: flat,
      onTap: onTap,
      child: AppIcon(
        icon,
        size: size,
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key, this.size = 30, this.color});

  final AppIcons icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "icons/${iconName(icon)}.svg",
      color: color ?? Colors.white,
      height: size,
      width: size,
    );
  }
}
