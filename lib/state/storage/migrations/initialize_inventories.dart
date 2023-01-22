import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/inventories.dart';
import 'package:protobuf/protobuf.dart';

Character initializeInventories(Character character) {
  return character.rebuild((character) {
    if (character.inventories.isEmpty) {
      character.inventories.addAll([
        Inventory(uuid: inventoryNameSelf, name: inventoryNameSelf).freeze()
            as Inventory,
        Inventory(uuid: inventoryNameBackpack, name: inventoryNameBackpack)
            .freeze() as Inventory,
        Inventory(uuid: inventoryNameHome, name: inventoryNameHome).freeze()
            as Inventory,
      ]);
      return;
    }

    final mainInventories = [
      inventoryNameSelf,
      inventoryNameBackpack,
      inventoryNameHome
    ];

    List<Inventory> addedInventories = List.empty(growable: true);
    for (var inventory in character.inventories) {
      if (inventory.uuid.isEmpty) {
        for (var i = 0; i < mainInventories.length; i++) {
          final uuid = mainInventories[i];

          if (inventory.name.contains(uuid)) {
            final newInventory = inventory.rebuild((inventory) {
              inventory.uuid = uuid;
              if (!inventory.hasOrder()) {
                inventory.order = i;
              }
            });
            addedInventories.add(newInventory);
          }
        }
      }
    }
    final inventories = character.inventories
        .where((element) => element.uuid.isNotEmpty)
        .toList();
    character.inventories.clear();
    character.inventories.addAll(inventories);
  });
}
