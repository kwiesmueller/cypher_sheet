import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/create.dart';
import 'package:flutter/widgets.dart';

class CreateArtifact extends StatelessWidget {
  const CreateArtifact({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateDialog<Artifact>(() => EditableArtifact.empty());
  }
}
