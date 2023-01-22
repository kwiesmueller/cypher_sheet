import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteFilter {
  const NoteFilter({required this.activeTypes});

  final List<NoteType> activeTypes;

  bool isTypeActive(NoteType type) {
    if (activeTypes.contains(type)) {
      return true;
    }
    return false;
  }

  bool isTypeExclusive(NoteType type) {
    if (activeTypes.length != 1) {
      return false;
    }
    if (activeTypes.first != type) {
      return false;
    }
    return true;
  }

  bool isActive(Note note) {
    if (activeTypes.isEmpty) {
      return true;
    }
    if (!note.hasType()) {
      return true;
    }
    if (activeTypes.contains(note.type)) {
      return true;
    }

    return false;
  }

  NoteFilter toggleFilter(NoteType type) {
    bool wasActive = false;
    final newActiveTypes = activeTypes.where((element) {
      if (element == type) {
        wasActive = true;
        return false;
      }
      return true;
    }).toList();
    if (!wasActive) {
      newActiveTypes.add(type);
    }
    return NoteFilter(
      activeTypes: newActiveTypes,
    );
  }
}

class NoteFilterNotifier extends StateNotifier<NoteFilter> {
  NoteFilterNotifier()
      : super(const NoteFilter(
          activeTypes: [],
        ));

  void toggleFilter(NoteType type) {
    state = state.toggleFilter(type);
  }

  void toggleExclusive(NoteType type) {
    bool isCurrentlyExclusive = state.isTypeExclusive(type);

    final active =
        isCurrentlyExclusive ? activateAll() : deactivateAll(except: type);
    state = NoteFilter(activeTypes: active);
  }

  List<NoteType> activateAll({NoteType? except}) {
    return NoteType.values.where((element) {
      if (except != null) {
        if (element == except) {
          return false;
        }
      }
      return true;
    }).toList(growable: false);
  }

  List<NoteType> deactivateAll({NoteType? except}) {
    return [if (except != null) except];
  }
}
