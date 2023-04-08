import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateCypher extends StatelessWidget {
  const UpdateCypher(this.original, {super.key});

  final Cypher original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Cypher>(() => EditableCypher.from(original));
  }
}
