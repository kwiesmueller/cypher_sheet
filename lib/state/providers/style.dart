import 'dart:ui';

import 'package:cypher_sheet/extensions/character.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = Provider<Color?>((ref) {
  final character = ref.watch(characterProvider);
  if (character.isReady()) {
    return Color.fromRGBO(
        character.color.r, character.color.g, character.color.b, 1.0);
  }
  return null;
});
