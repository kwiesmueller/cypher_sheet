import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/item_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.items));
});

final itemSearchProvider = StateProvider((ref) => "");
final itemSearchActiveProvider = StateProvider((ref) => false);

final itemFilterProvider =
    StateNotifierProvider<ItemFilterNotifier, ItemFilter>((ref) {
  return ItemFilterNotifier();
});

final filteredItemsProvider =
    Provider.autoDispose.family<List<Item>, String>((ref, inventory) {
  final filter = ref.watch(itemFilterProvider);
  final search = ref.watch(itemSearchProvider);
  final items = ref
      .watch(itemsProvider)
      .where((element) => element.path.inventory == inventory)
      .where((element) => element.path.parent.isEmpty)
      .where((element) => filter.isActive(element))
      .where((element) =>
          search.isEmpty ||
          element.name.contains(search) ||
          element.description.contains(search) ||
          element.shortDescription.contains(search) ||
          ref.watch(subItemsProvider(element.path.self)).where((item) {
            return item.name.contains(search) ||
                item.shortDescription.contains(search) ||
                item.description.contains(search);
          }).isNotEmpty)
      .toList(growable: false);

  items.sort((a, b) {
    return a.name.compareTo(b.name);
  });

  return items;
});

final subItemsProvider =
    Provider.autoDispose.family<List<Item>, String>((ref, arg) {
  return ref
      .watch(itemsProvider)
      .where((element) => element.path.parent == arg)
      .toList(growable: false);
});

final itemProvider = Provider.autoDispose.family<Item, String>((ref, item) {
  final items = ref.watch(itemsProvider);
  if (items.isEmpty) {
    return Item();
  }
  return items.firstWhere((element) => element.path.self == item,
      orElse: () => Item());
});
