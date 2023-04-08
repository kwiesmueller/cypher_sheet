import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/artifact/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportArtifact extends StatelessWidget {
  const ImportArtifact(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Artifact original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Artifact>(
      () => EditableArtifact.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
