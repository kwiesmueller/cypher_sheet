import 'package:cypher_sheet/proto/character.pb.dart';

extension RecoveryHelper on Recovery {
  void toggle(Recover recover) {
    switch (recover) {
      case Recover.one_action:
        oneAction = !oneAction;
        break;
      case Recover.one_hour:
        oneHour = !oneHour;
        break;
      case Recover.ten_minutes:
        tenMinutes = !tenMinutes;
        break;
      case Recover.ten_hours:
        tenHours = !tenHours;
        break;
    }
  }
}
