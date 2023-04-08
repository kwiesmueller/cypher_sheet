import 'package:cypher_sheet/main.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/stat.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/views/dialogs/create_character.dart';
import 'package:cypher_sheet/views/dialogs/tier.dart';

class CharacterMeta extends ConsumerWidget {
  const CharacterMeta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CharacterName(
                ref.watch(characterProvider.select((value) => value.name))),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: StatBox(
                value: AppText(ref
                    .watch(characterProvider
                        .select((value) => value.progress.tier))
                    .toString()),
                size: 40,
                borderRadius: 8,
                onTap: () {
                  showAppDialog(context, const TierEdit());
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 30,
              width: 30,
              child: AppBox(
                onTap: () {
                  ref.invalidate(characterListProvider);
                  Navigator.of(context).pushReplacementNamed(routeCharacters);
                  ref.read(characterProvider.notifier).reset();
                },
                flat: true,
                padding: 0.0,
                child: const AppIcon(
                  AppIcons.close,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CharacterMetaSubtext("is a "),
              CharacterMetaText(ref.watch(
                  characterProvider.select((value) => value.descriptor))),
              const CharacterMetaSubtext(" "),
              CharacterMetaText(
                  ref.watch(characterProvider.select((value) => value.type)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CharacterMetaSubtext("who "),
              CharacterMetaText(
                  ref.watch(characterProvider.select((value) => value.focus)))
            ],
          ),
        )
      ],
    );
  }
}

class CharacterName extends ConsumerWidget {
  const CharacterName(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBox(
      flat: true,
      padding: 0,
      onTapGesture: () {
        showAppDialog(
          context,
          CreateCharacter.fromState(ref.watch(characterProvider)),
          fullscreen: true,
        );
      },
      child: AppText(
        name,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

class CharacterMetaText extends ConsumerWidget {
  const CharacterMetaText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBox(
      flat: true,
      padding: 0,
      onTapGesture: () {
        showAppDialog(
          context,
          CreateCharacter.fromState(ref.watch(characterProvider)),
          fullscreen: true,
        );
      },
      child: AppText(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class CharacterMetaSubtext extends ConsumerWidget {
  const CharacterMetaSubtext(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppText(
      text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }
}
