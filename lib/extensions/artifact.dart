import 'package:cypher_sheet/proto/character.pb.dart';

extension ShareHelper on Artifact {
  SharedObject share() {
    return SharedObject(
      uuid: uuid,
      name: name,
      artifact: this,
    );
  }
}
