import 'package:cypher_sheet/proto/character.pb.dart';

extension ShareHelper on Ability {
  SharedObject share() {
    return SharedObject(
      uuid: uuid,
      name: name,
      ability: this,
    );
  }
}
