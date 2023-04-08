import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/item/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateItem extends StatelessWidget {
  const UpdateItem(this.original, {super.key});

  final Item original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Item>(() => EditableItem.from(original));
  }
}
