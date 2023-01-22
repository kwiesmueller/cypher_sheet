import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemFilter {
  const ItemFilter({required this.activeTypes});

  final List<ItemType> activeTypes;

  bool isTypeActive(ItemType type) {
    if (activeTypes.contains(type)) {
      return true;
    }
    return false;
  }

  bool isTypeExclusive(ItemType type) {
    if (activeTypes.length != 1) {
      return false;
    }
    if (activeTypes.first != type) {
      return false;
    }
    return true;
  }

  bool isActive(Item item) {
    if (activeTypes.isEmpty) {
      return true;
    }
    if (item.types.isEmpty) {
      return true;
    }
    for (var type in item.types) {
      if (activeTypes.contains(type)) {
        return true;
      }
    }
    return false;
  }

  ItemFilter toggleFilter(ItemType type) {
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
    return ItemFilter(
      activeTypes: newActiveTypes,
    );
  }
}

class ItemFilterNotifier extends StateNotifier<ItemFilter> {
  ItemFilterNotifier()
      : super(const ItemFilter(
          activeTypes: [],
        ));

  void toggleFilter(ItemType type) {
    state = state.toggleFilter(type);
  }

  void toggleExclusive(ItemType type) {
    bool isCurrentlyExclusive = state.isTypeExclusive(type);

    final active =
        isCurrentlyExclusive ? deactivateAll() : deactivateAll(except: type);
    state = ItemFilter(activeTypes: active);
  }

  List<ItemType> activateAll({ItemType? except}) {
    return ItemType.values.where((element) {
      if (except != null) {
        if (element == except) {
          return false;
        }
      }
      return true;
    }).toList(growable: false);
  }

  List<ItemType> deactivateAll({ItemType? except}) {
    return [if (except != null) except];
  }
}
