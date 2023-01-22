import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer({super.key, this.minWidth = 8.0, this.minHeight = 24.0});

  final double minWidth;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth, minHeight: minHeight),
    );
  }
}
