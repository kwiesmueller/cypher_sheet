import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/note_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.notes));
});

final noteSearchProvider = StateProvider((ref) => "");
final noteSearchActiveProvider = StateProvider((ref) => false);

final noteFilterProvider =
    StateNotifierProvider<NoteFilterNotifier, NoteFilter>((ref) {
  return NoteFilterNotifier();
});

final filteredNotesProvider = Provider<List<Note>>((ref) {
  final filter = ref.watch(noteFilterProvider);
  final search = ref.watch(noteSearchProvider);
  final notes = ref
      .watch(notesProvider)
      .where((element) => filter.isActive(element))
      .where((element) =>
          search.isEmpty ||
          element.title.contains(search) ||
          element.shortDescription.contains(search) ||
          element.text.contains(search))
      .toList(growable: false);

  notes.sort((a, b) {
    return a.title.compareTo(b.title);
  });

  return notes;
});

final noteProvider = Provider.autoDispose.family<Note, String>((ref, arg) {
  final notes = ref.watch(notesProvider);
  if (notes.isEmpty) {
    return Note();
  }
  return notes.firstWhere((element) => element.uuid == arg,
      orElse: () => Note());
});
