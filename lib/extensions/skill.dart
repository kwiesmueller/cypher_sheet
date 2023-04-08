import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

extension SkillLevelToIcon on SkillLevel {
  AppIcons toIcon() {
    switch (this) {
      case SkillLevel.trained:
        return AppIcons.trained;
      case SkillLevel.specialized:
        return AppIcons.specialized;
      case SkillLevel.inability:
        return AppIcons.inability;
      default:
        assert(false);
        return AppIcons.other;
    }
  }
}

extension SkillLevelLabel on SkillLevel {
  String toLabel() {
    final name = toString();
    if (name.isEmpty) {
      return "<unknown>";
    }
    return name[0].toUpperCase() + name.substring(1);
  }
}

extension Comparable on SkillLevel {
  int compareTo(SkillLevel other) {
    return value.compareTo(other.value);
  }
}

extension ShareHelper on Skill {
  SharedObject share() {
    return SharedObject(
      uuid: uuid,
      name: name,
      skill: this,
    );
  }
}
