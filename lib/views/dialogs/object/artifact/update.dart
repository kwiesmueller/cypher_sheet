import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/update.dart';
import 'package:flutter/widgets.dart';

class UpdateArtifact extends StatelessWidget {
  const UpdateArtifact(this.original, {super.key});

  final Artifact original;

  @override
  Widget build(BuildContext context) {
    return UpdateDialog<Artifact>(
        () => EditableArtifact.from(original));
  }
}
