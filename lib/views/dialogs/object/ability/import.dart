import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportAbility extends StatelessWidget {
  const ImportAbility(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Ability original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Ability>(
      () => EditableAbility.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
