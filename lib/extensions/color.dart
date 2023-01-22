import 'dart:ui';

import 'package:cypher_sheet/proto/character.pb.dart';

extension ColorHelper on CharacterColor {
  Color toColor() {
    return Color.fromRGBO(r, g, b, 1.0);
  }
}

CharacterColor characterColorFromColor(Color color) {
  return CharacterColor(r: color.red, g: color.green, b: color.blue);
}
