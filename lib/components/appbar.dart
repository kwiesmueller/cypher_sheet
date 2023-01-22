import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/meta.dart';

class CharacterSheetAppBar extends ConsumerWidget {
  const CharacterSheetAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppBar(
      height: 130.0,
      child: CharacterMeta(),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key, required this.child, this.height = 65.0});

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      primary: true,
      stretch: false,
      collapsedHeight: height,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
