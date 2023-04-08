import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportSkill extends StatelessWidget {
  const ImportSkill(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Skill original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Skill>(
      () => EditableSkill.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
