import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:flutter/widgets.dart';

class CreateCypher extends StatelessWidget {
  const CreateCypher({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Cypher>(() => EditableCypher.empty());
  }
}
