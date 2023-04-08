import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/state/filters/item_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/item/inputs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditableItem extends GenericEditable<Item> {
  factory EditableItem.empty(ItemPath path) {
    final original = Item.create();
    final edit = EditableItem._(path, original);
    edit.loadFields(original);
    return edit;
  }

  factory EditableItem.from(Item original) {
    final edit = EditableItem._(original.path, original);
    edit.loadFields(original);
    return edit;
  }

  // We keep track of the path we started at to know if the item was moved.
  final ItemPath originalPath;
  final ItemPath path;

  EditableItem._(ItemPath path, Item original)
      : path = ItemPath(
          inventory: path.inventory,
          parent: path.parent,
          self: path.self,
        ),
        originalPath = path,
        types = ItemFilter(activeTypes: original.types),
        subItemType = original.hasSubItemType() ? original.subItemType : null,
        super(
          "Item",
          createNewEmpty: () => Item.create(),
          updateInState: (CharacterNotifier ref) => ref.updateItem,
          createInState: (CharacterNotifier ref) => ref.addItem,
          deleteInState: (CharacterNotifier ref) => ref.deleteItem,
          clearUuid: (Item obj) => obj.path.clearSelf(),
          setUuid: (Item obj, String uuid) => obj.path.self = uuid,
          textFields: {},
          boolFields: {},
          doubleFields: {},
          intFields: {},
          originalUUID: path.self,
        );

  @override
  Widget inputs(Function(Function()) setState) {
    return ItemEditInputs(this, setState);
  }

  TextEditingController get name => textFields["name"]!;
  TextEditingController get shortDescription => textFields["shortDescription"]!;
  TextEditingController get description => textFields["description"]!;
  TextEditingController get amount => doubleFields["amount"]!;
  TextEditingController get value => doubleFields["value"]!;
  TextEditingController get armor => intFields["armor"]!;

  ItemFilter types;
  ItemType? subItemType;

  @override
  void setOtherFields(Item obj) {
    obj.types.clear();
    obj.types.addAll(
        types.activeTypes.isNotEmpty ? types.activeTypes : [ItemType.others]);

    if (subItemType != null) {
      obj.subItemType = subItemType!;
    } else {
      obj.clearSubItemType();
    }

    obj.path = path;

    if (!obj.hasAmount()) {
      obj.amount = 1;
    }
  }

  // Override the update handler to make sure inventory items are moved correctly.
  @override
  void update(WidgetRef ref) {
    final obj = finalize();
    if (originalUUID.isNotEmpty) {
      setUuid(obj, originalUUID);
    }
    final hasMoved =
        path.inventory.isNotEmpty && path.inventory != originalPath.inventory;
    if (hasMoved) {
      ref.read(characterProvider.notifier).moveItem(obj);
    } else {
      updateInState(ref.read(characterProvider.notifier))(obj);
    }
  }

  @override
  String get objectName => name.value.text;
}
