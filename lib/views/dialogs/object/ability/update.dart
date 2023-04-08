import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/ability/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateAbility extends StatelessWidget {
  const UpdateAbility(this.original, {super.key});

  final Ability original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Ability>(
        () => EditableAbility.from(original));
  }
}
