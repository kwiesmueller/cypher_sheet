import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class AppMarkdown extends StatelessWidget {
  const AppMarkdown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context).copyWith(
        // TODO: fix our own textStyle as we're kind of misusing it
        textTheme: Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(fontSize: 32),
              titleLarge: const TextStyle(fontSize: 28),
              titleMedium: const TextStyle(fontSize: 24),
              titleSmall: const TextStyle(fontSize: 22),
              bodyLarge: const TextStyle(fontSize: 20),
              bodyMedium: const TextStyle(fontSize: 18, height: 1.3),
            ),
      )),
      onTapLink: (text, href, title) async {
        if (href == null) {
          return;
        }
        final Uri url = Uri.parse(href);
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
