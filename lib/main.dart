import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/providers/style.dart';
import 'package:cypher_sheet/views/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cypher_sheet/state/observer.dart';
import 'package:cypher_sheet/views/abilities.dart';
import 'package:cypher_sheet/views/characters.dart';
import 'package:cypher_sheet/views/cyphers.dart';
import 'package:cypher_sheet/views/equipment.dart';
import 'package:cypher_sheet/views/skills.dart';
import 'package:cypher_sheet/views/stats.dart';
import 'package:cypher_sheet/views/view.dart';

void main() {
  runApp(
      ProviderScope(observers: [Persister()], child: const CypherSheetApp()));
}

class CypherSheetApp extends ConsumerWidget {
  const CypherSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseTheme = ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(25, 25, 25, 1),
      colorScheme: ThemeData.dark(useMaterial3: true).colorScheme.copyWith(
            primary: ref.watch(colorProvider) ??
                const Color.fromRGBO(75, 149, 236, 1.0),
            surface: const Color.fromARGB(255, 52, 52, 52),
            surfaceVariant: const Color.fromRGBO(87, 87, 87, 1),
            surfaceTint: const Color.fromARGB(255, 30, 30, 30),
            error: const Color.fromARGB(255, 189, 73, 73),
            onSurface: Colors.white,
          ),
    );

    return MaterialApp(
      title: 'Cypher Sheet',
      theme: baseTheme.copyWith(
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: baseTheme.scaffoldBackgroundColor,
          ),
          textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme).copyWith(
            displayLarge: TextStyle(
                color: baseTheme.colorScheme.primary,
                fontSize: 40,
                letterSpacing: 0.0),
            displayMedium: const TextStyle(fontSize: 22),
            displaySmall:
                TextStyle(color: baseTheme.colorScheme.primary, fontSize: 16),
            bodyLarge: const TextStyle(fontSize: 30, height: 1),
            bodyMedium: const TextStyle(fontSize: 26, height: .94),
            bodySmall: const TextStyle(fontSize: 20, height: 1),
            labelLarge: const TextStyle(
                fontSize: 18, height: 1, fontWeight: FontWeight.w400),
            labelMedium: const TextStyle(
              fontSize: 14,
              height: 1.2,
              fontWeight: FontWeight.w400,
            ),
            labelSmall: const TextStyle(fontSize: 12, height: 1),
          ),
          buttonTheme: baseTheme.buttonTheme.copyWith(
            alignedDropdown: false,
          )),
      home: ref.watch(characterProvider).uuid.isEmpty
          ? const CharactersView()
          : const CharacterSheet(),
    );
  }
}

class CharacterSheet extends StatelessWidget {
  const CharacterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AppView(
        views: [
          ViewConfig("Database", AppIcons.database, Container()),
          ViewConfig("Skills", AppIcons.skills, const SkillsView()),
          ViewConfig("Abilities", AppIcons.abilities, const AbilitiesView()),
          ViewConfig("Stats", AppIcons.stats, const StatsView()),
          ViewConfig("Cyphers", AppIcons.cypher, const CyphersView()),
          ViewConfig("Equipment", AppIcons.equipment, const EquipmentView()),
          ViewConfig("Notes", AppIcons.notes, const NotesView()),
        ],
      ),
    );
  }
}
