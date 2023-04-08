import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateSkill extends StatelessWidget {
  const UpdateSkill(this.original, {super.key});

  final Skill original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Skill>(() => EditableSkill.from(original));
  }
}
