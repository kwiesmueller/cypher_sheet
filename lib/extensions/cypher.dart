import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

extension CypherTypeHelper on CypherType {
  AppIcons toIcon() {
    switch (this) {
      case CypherType.cypher:
        return AppIcons.cypher;
      case CypherType.artifact:
        return AppIcons.artifact;
      default:
        assert(false);
        return AppIcons.other;
    }
  }
}

extension ShareHelper on Cypher {
  SharedObject share() {
    return SharedObject(
      uuid: uuid,
      name: name,
      cypher: this,
    );
  }
}
