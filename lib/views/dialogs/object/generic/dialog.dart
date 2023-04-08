import 'package:cypher_sheet/views/dialogs/object/generic/editable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenericEditDialog<OriginalT> extends ConsumerStatefulWidget {
  const GenericEditDialog(this.viewBuilder, this.editableCreator, {super.key});

  final Widget Function(Editable<OriginalT> edit,
      void Function(void Function()) setState, WidgetRef ref) viewBuilder;
  final Editable<OriginalT> Function() editableCreator;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GenericEditDialogState<OriginalT>();
}

class _GenericEditDialogState<OriginalT>
    extends ConsumerState<GenericEditDialog<OriginalT>> {
  late Editable<OriginalT> edit;

  @override
  void initState() {
    super.initState();

    edit = widget.editableCreator();
  }

  @override
  void dispose() {
    edit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewBuilder(edit, setState, ref);
  }
}
