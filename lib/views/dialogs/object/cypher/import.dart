import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/views/dialogs/object/cypher/editable.dart';
import 'package:cypher_sheet/views/dialogs/object/generic/import.dart';
import 'package:flutter/widgets.dart';

class ImportCypher extends StatelessWidget {
  const ImportCypher(
    this.original, {
    super.key,
    this.onCancel,
    this.onSuccess,
  });

  final Cypher original;
  final Function()? onCancel;
  final Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportDialog<Cypher>(
      () => EditableCypher.from(original),
      onCancel: onCancel,
      onSuccess: onSuccess,
    );
  }
}
