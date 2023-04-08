import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:cypher_sheet/views/dialogs/object/item/editable.dart';
import 'package:flutter/widgets.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({
    super.key,
    required this.path,
  });

  final ItemPath path;

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Item>(() => EditableItem.empty(path));
  }
}
