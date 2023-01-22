import 'package:cypher_sheet/proto/character.pb.dart';

extension DamageHelper on Damage {
  void toggleImpaired() {
    impaired = !impaired;
  }

  void toggleDebilitated() {
    debilitated = !debilitated;
  }
}
