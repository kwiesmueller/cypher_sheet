import 'package:cypher_sheet/extensions/editable.dart';
import 'package:cypher_sheet/state/character.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart';

abstract class Editable<Original> {
  Widget inputs(Function(Function()) setState);
  String get typeName;
  String get objectName;
  void create(WidgetRef ref);
  void update(WidgetRef ref);
  void delete(WidgetRef ref);
  void import(WidgetRef ref);
  void dispose();
}

// GenericEditable provides automatic handling of certain proto fields by
// converting them between an editable type and their proto representation.
// This way we only need to specify the field names/tags and map them to
// variables in dart. The process of creating a new object after editing is
// taken care of.
// Some field types can't be supported so the implementer can simply manage them
// manually and override setOtherFields to make sure they are set on the new
// object.
abstract class GenericEditable<T extends GeneratedMessage>
    implements Editable<T> {
  GenericEditable(
    String typeName, {
    required this.originalUUID,
    required this.createNewEmpty,
    required this.updateInState,
    required this.createInState,
    required this.deleteInState,
    required this.clearUuid,
    required this.setUuid,
    required this.textFields,
    required this.boolFields,
    this.doubleFields = const {},
    this.intFields = const {},
  }) : _typeName = typeName;

  final String _typeName;
  // createNewEmpty must create a GeneratedMessage that is not frozen.
  // So one should use .create() not .getDefault().
  final T Function() createNewEmpty;

  final void Function(T obj) Function(CharacterNotifier ref) updateInState;
  final void Function(T obj) Function(CharacterNotifier ref) createInState;
  final void Function(String uuid) Function(CharacterNotifier ref)
      deleteInState;

  final void Function(T obj) clearUuid;
  final void Function(T obj, String uuid) setUuid;

  final String originalUUID;

  Map<String, TextEditingController> textFields;
  Map<String, TextEditingController> doubleFields;
  Map<String, TextEditingController> intFields;
  Map<String, bool> boolFields;

  @override
  void create(WidgetRef ref) {
    createInState(ref.read(characterProvider.notifier))(finalize());
  }

  @override
  void delete(WidgetRef ref) {
    if (originalUUID.isEmpty) {
      assert(originalUUID.isNotEmpty);
      return;
    }
    deleteInState(ref.read(characterProvider.notifier))(originalUUID);
  }

  @override
  void dispose() {
    if (!_isFinalized) {
      textFields.forEach((key, value) {
        value.dispose();
      });
    }
  }

  @override
  void import(WidgetRef ref) {
    final obj = finalize();
    clearUuid(obj);
    createInState(ref.read(characterProvider.notifier))(obj);
  }

  // loadFields can be used instead of the constructor fields to load all
  // currently supported fields into the Editable.
  void loadFields(T from) {
    mergeEditableFieldsFrom(
      from,
      strings: textFields,
      bools: boolFields,
      doubles: doubleFields,
      ints: intFields,
    );
  }

  @override
  get typeName => _typeName;

  @override
  void update(WidgetRef ref) {
    final obj = finalize();
    if (originalUUID.isNotEmpty) {
      setUuid(obj, originalUUID);
    }
    updateInState(ref.read(characterProvider.notifier))(obj);
  }

  bool _isFinalized = false;

  // finalize turns the editable object back into a artifact.
  // Must only be called once as it disposes any TextEditingControllers.
  T finalize() {
    assert(!_isFinalized);
    _isFinalized = true;

    final obj = createNewEmpty();

    textFields.forEach(textFieldsUpdater(obj));
    boolFields.forEach(boolFieldsUpdater(obj));
    doubleFields.forEach(doubleFieldsUpdater(obj));
    intFields.forEach(intFieldsUpdater(obj));

    setOtherFields(obj);

    return obj;
  }

  void setOtherFields(T obj) {}
}
