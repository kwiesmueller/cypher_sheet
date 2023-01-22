import 'package:cypher_sheet/proto/character.pb.dart';

extension CharacterHelper on Character {
  bool isReady() {
    return uuid.isNotEmpty;
  }
}
