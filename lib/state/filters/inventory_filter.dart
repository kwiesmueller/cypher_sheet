import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryFilter {
  const InventoryFilter({required this.activeInventories});

  final List<String> activeInventories;

  bool isTypeActive(String uuid) {
    if (activeInventories.contains(uuid)) {
      return true;
    }
    return false;
  }

  bool isActive(Inventory inventory) {
    if (activeInventories.isEmpty) {
      return true;
    }
    if (activeInventories.contains(inventory.uuid)) {
      return true;
    }

    return false;
  }
}

class InventoryFilterNotifier extends StateNotifier<InventoryFilter> {
  InventoryFilterNotifier()
      : super(const InventoryFilter(
          activeInventories: [],
        ));

  void toggleInventory(String uuid) {
    bool wasActive = false;
    final activeInventories = state.activeInventories.where((element) {
      if (element == uuid) {
        wasActive = true;
        return false;
      }
      return true;
    }).toList();
    if (!wasActive) {
      activeInventories.add(uuid);
    }
    state = InventoryFilter(
      activeInventories: activeInventories,
    );
  }
}
