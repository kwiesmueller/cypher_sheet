import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.bottomNavigationBar});

  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      extendBody: true,
      primary: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton(this.icon, this.text, this.onPressed, {super.key});

  final Widget icon;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
