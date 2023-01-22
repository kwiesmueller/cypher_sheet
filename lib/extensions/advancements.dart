import 'package:cypher_sheet/proto/character.pb.dart';

extension AdvancementsHelper on Advancements {
  int activeCount() {
    var count = 0;
    if (increaseCapabilities) {
      count++;
    }
    if (moveTowardPerfection) {
      count++;
    }
    if (extraEffort) {
      count++;
    }
    if (skillTraining) {
      count++;
    }
    if (other) {
      count++;
    }
    return count;
  }

  // This provides the number needed per tier (which can be distinctly different
  // from the number of available advancements)
  int advancementsPerTier() {
    return 4;
  }

  int xpPerAdvancement() {
    return 4;
  }

  bool canAdvanceTier() {
    return activeCount() >= advancementsPerTier();
  }

  bool advancement(Advancement advancement) {
    switch (advancement) {
      case Advancement.increaseCapabilities:
        return increaseCapabilities;
      case Advancement.moveTowardPerfection:
        return moveTowardPerfection;
      case Advancement.extraEffort:
        return extraEffort;
      case Advancement.skillTraining:
        return skillTraining;
      case Advancement.other:
        return other;
      default:
        assert(false);
        return false;
    }
  }

  bool toggleAdvancement(Advancement advancement) {
    switch (advancement) {
      case Advancement.increaseCapabilities:
        increaseCapabilities = !increaseCapabilities;
        return increaseCapabilities;
      case Advancement.moveTowardPerfection:
        moveTowardPerfection = !moveTowardPerfection;
        return moveTowardPerfection;
      case Advancement.extraEffort:
        extraEffort = !extraEffort;
        return extraEffort;
      case Advancement.skillTraining:
        skillTraining = !skillTraining;
        return skillTraining;
      case Advancement.other:
        other = !other;
        return other;
      default:
        assert(false);
        return false;
    }
  }
}

extension AdvancementHelper on Advancement {
  AdvancementInfo info() {
    switch (this) {
      case Advancement.increaseCapabilities:
        return AdvancementInfo(
          name: "Increase Capabilities",
          description: "+4 points into stat Points",
        );
      case Advancement.moveTowardPerfection:
        return AdvancementInfo(
          name: "Move toward Perfection",
          description: "+1 to the Edge of your choice",
        );
      case Advancement.extraEffort:
        return AdvancementInfo(
          name: "Extra Effort",
          description: "+1 into Effort",
        );
      case Advancement.skillTraining:
        return AdvancementInfo(
          name: "Skill Training",
          description: "Train in a skill or specialize in a trained skill",
        );
      case Advancement.other:
        return AdvancementInfo(
          name: "Other",
          description: "Refer to the Rule Book",
        );
      default:
        assert(false);
        return AdvancementInfo();
    }
  }
}
