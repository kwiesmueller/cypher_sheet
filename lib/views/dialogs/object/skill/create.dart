import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/skill/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:flutter/widgets.dart';

class CreateSkill extends StatelessWidget {
  const CreateSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Skill>(() => EditableSkill.empty());
  }
}
