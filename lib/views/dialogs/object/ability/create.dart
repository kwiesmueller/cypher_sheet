import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:flutter/widgets.dart';

class CreateAbility extends StatelessWidget {
  const CreateAbility({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Ability>(() => EditableAbility.empty());
  }
}
