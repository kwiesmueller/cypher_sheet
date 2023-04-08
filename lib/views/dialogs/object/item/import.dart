import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/item/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportItem extends StatelessWidget {
  const ImportItem(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Item original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Item>(
      () => EditableItem.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
