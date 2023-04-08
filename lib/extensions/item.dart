import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

import 'package:equatable/equatable.dart';

class ItemUUID extends Equatable {
  const ItemUUID(this.inventory, this.item);

  final String inventory;
  final String item;

  @override
  List<Object> get props => [inventory, item];

  @override
  bool get stringify => true;
}

extension Icon on ItemType {
  AppIcons toIcon() {
    switch (this) {
      case ItemType.armor:
        return AppIcons.armor;
      case ItemType.clothing:
        return AppIcons.clothing;
      case ItemType.oddity:
        return AppIcons.oddity;
      case ItemType.others:
        return AppIcons.other;
      case ItemType.tool:
        return AppIcons.tool;
      case ItemType.weapon:
        return AppIcons.weapon;
      case ItemType.material:
        return AppIcons.material;
      case ItemType.ammo:
        return AppIcons.ammo;
      case ItemType.plan:
        return AppIcons.plan;
      default:
        assert(false);
        return AppIcons.other;
    }
  }
}

extension Label on ItemType {
  String toLabel() {
    final name = toString();
    if (name.isEmpty) {
      return "<unknown>";
    }
    return name[0].toUpperCase() + name.substring(1);
  }
}

extension ShareHelper on Item {
  SharedObject share() {
    // TODO: figure out how to handle subItems.
    return SharedObject(
      uuid: path.self,
      name: name,
      item: this,
    );
  }
}
