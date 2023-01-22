import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/inventory_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String inventoryNameSelf = "Self";
const String inventoryNameBackpack = "Backpack";
const String inventoryNameHome = "Home";

final inventoriesProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.inventories));
});

final inventoryFilterProvider =
    StateNotifierProvider<InventoryFilterNotifier, InventoryFilter>((ref) {
  return InventoryFilterNotifier();
});

final inventoryProvider =
    Provider.family.autoDispose<Inventory, String>((ref, arg) {
  final inventories = ref.watch(inventoriesProvider);
  if (inventories.isEmpty) {
    return Inventory();
  }
  return inventories.firstWhere((element) => element.uuid == arg,
      orElse: () => Inventory());
});

final filteredInventoriesProvider = Provider<List<Inventory>>((ref) {
  final filter = ref.watch(inventoryFilterProvider);
  final inventories = ref
      .watch(inventoriesProvider)
      .where((element) => filter.isActive(element))
      .toList(growable: false);

  // this in combination with the default order values in initialize_inventories.dart
  // should always put Self and Backpack on top if not configured otherwise
  inventories.sort((a, b) {
    return a.order.compareTo(b.order);
  });

  return inventories;
});
