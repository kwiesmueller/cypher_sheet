import 'package:cypher_sheet/components/equipment.dart';
import 'package:flutter/widgets.dart';
import 'package:protobuf/protobuf.dart';

Map<String, TextEditingController> getEditableTextFieldsFrom(
    GeneratedMessage msg) {
  final Map<String, TextEditingController> fields = {};
  mergeEditableTextFieldsFrom(msg, fields);
  return fields;
}

void mergeEditableTextFieldsFrom(
    GeneratedMessage msg, Map<String, TextEditingController> into) {
  // TODO: is byIndex more efficient but still safe?
  for (var fieldName in msg.info_.byName.keys) {
    final fieldValue = msg.info_.byName[fieldName];
    if (fieldValue == null) {
      assert(fieldValue != null);
      continue;
    }

    if (fieldValue.type != PbFieldType.OS) {
      continue;
    }
    into[fieldName] =
        TextEditingController(text: msg.getField(fieldValue.tagNumber));
  }
}

// Must only be called once per message as it disposes all TextEditingControllers.
Function(String key, TextEditingController value) textFieldsUpdater(
    GeneratedMessage msg) {
  return (key, value) {
    final tagNumber = msg.getTagNumber(key);
    if (tagNumber == null) {
      assert(tagNumber != null);
      return;
    }
    msg.setField(tagNumber, value.value.text);
    value.dispose();
  };
}

Map<String, TextEditingController> getEditableDoubleFieldsFrom(
    GeneratedMessage msg) {
  final Map<String, TextEditingController> fields = {};
  mergeEditableDoubleFieldsFrom(msg, fields);
  return fields;
}

void mergeEditableDoubleFieldsFrom(
    GeneratedMessage msg, Map<String, TextEditingController> into) {
  // TODO: is byIndex more efficient but still safe?
  for (var fieldName in msg.info_.byName.keys) {
    final fieldValue = msg.info_.byName[fieldName];
    if (fieldValue == null) {
      assert(fieldValue != null);
      continue;
    }

    if (fieldValue.type != PbFieldType.OD) {
      continue;
    }
    into[fieldName] = TextEditingController(
        text:
            removeZeroDecimals(msg.getField(fieldValue.tagNumber)).toString());
  }
}

Function(String key, TextEditingController value) doubleFieldsUpdater(
    GeneratedMessage msg) {
  return (key, value) {
    final tagNumber = msg.getTagNumber(key);
    if (tagNumber == null) {
      assert(tagNumber != null);
      return;
    }
    final parsed = double.tryParse(value.value.text);
    if (value.value.text.isNotEmpty && parsed != null) {
      msg.setField(tagNumber, parsed);
    }
    value.dispose();
  };
}

Map<String, bool> getEditableBoolFieldsFrom(GeneratedMessage msg) {
  final Map<String, bool> fields = {};
  mergeEditableBoolFieldsFrom(msg, fields);
  return fields;
}

void mergeEditableBoolFieldsFrom(GeneratedMessage msg, Map<String, bool> into) {
  // TODO: is byIndex more efficient but still safe?
  for (var fieldName in msg.info_.byName.keys) {
    final fieldValue = msg.info_.byName[fieldName];
    if (fieldValue == null) {
      assert(fieldValue != null);
      continue;
    }

    if (fieldValue.type != PbFieldType.OB) {
      continue;
    }
    into[fieldName] = msg.getField(fieldValue.tagNumber);
  }
}

Function(String key, bool value) boolFieldsUpdater(GeneratedMessage msg) {
  return (key, value) {
    final tagNumber = msg.getTagNumber(key);
    if (tagNumber == null) {
      assert(tagNumber != null);
      return;
    }
    msg.setField(tagNumber, value);
  };
}

Map<String, TextEditingController> getEditableIntFieldsFrom(
    GeneratedMessage msg) {
  final Map<String, TextEditingController> fields = {};
  mergeEditableDoubleFieldsFrom(msg, fields);
  return fields;
}

void mergeEditableIntFieldsFrom(
    GeneratedMessage msg, Map<String, TextEditingController> into) {
  // TODO: is byIndex more efficient but still safe?
  for (var fieldName in msg.info_.byName.keys) {
    final fieldValue = msg.info_.byName[fieldName];
    if (fieldValue == null) {
      assert(fieldValue != null);
      continue;
    }

    if (fieldValue.type != PbFieldType.OD) {
      continue;
    }
    into[fieldName] = TextEditingController(
        text: msg.getField(fieldValue.tagNumber).toString());
  }
}

Function(String key, TextEditingController value) intFieldsUpdater(
    GeneratedMessage msg) {
  return (key, value) {
    final tagNumber = msg.getTagNumber(key);
    if (tagNumber == null) {
      assert(tagNumber != null);
      return;
    }
    final parsed = int.tryParse(value.value.text);
    if (value.value.text.isNotEmpty && parsed != null) {
      msg.setField(tagNumber, parsed);
    }
    value.dispose();
  };
}

void mergeEditableFieldsFrom(
  GeneratedMessage msg, {
  required Map<String, TextEditingController> strings,
  required Map<String, bool> bools,
  required Map<String, TextEditingController> doubles,
  required Map<String, TextEditingController> ints,
}) {
  // TODO: is byIndex more efficient but still safe?
  for (var fieldName in msg.info_.byName.keys) {
    final fieldValue = msg.info_.byName[fieldName];
    if (fieldValue == null) {
      assert(fieldValue != null);
      continue;
    }

    switch (fieldValue.type) {
      case PbFieldType.OS:
        strings[fieldName] =
            TextEditingController(text: msg.getField(fieldValue.tagNumber));
        break;
      case PbFieldType.OB:
        bools[fieldName] = msg.getField(fieldValue.tagNumber);
        break;
      case PbFieldType.OD:
        doubles[fieldName] = TextEditingController(
            text: removeZeroDecimals(msg.getField(fieldValue.tagNumber))
                .toString());
        break;
      case PbFieldType.O3:
        ints[fieldName] = TextEditingController(
            text: msg.getField(fieldValue.tagNumber).toString());
        break;
      default:
    }
  }
}
