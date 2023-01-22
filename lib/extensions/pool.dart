import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:protobuf/protobuf.dart';

extension Label on PoolType {
  String toLabel() {
    final name = toString();
    if (name.isEmpty) {
      return "<unknown>";
    }
    return name[0].toUpperCase() + name.substring(1);
  }
}

extension Comparable on PoolType {
  int compareTo(PoolType other) {
    return value.compareTo(other.value);
  }
}

extension Icon on PoolType {
  AppIcons toIcon() {
    switch (this) {
      case PoolType.intellect:
        return AppIcons.intellect;
      case PoolType.speed:
        return AppIcons.speed;
      case PoolType.might:
        return AppIcons.might;
      default:
        assert(false);
        return AppIcons.other;
    }
  }
}

extension StatsHelper on Stats {
  Stat getStatForPool(PoolType pool) {
    switch (pool) {
      case PoolType.intellect:
        return intellect;
      case PoolType.speed:
        return speed;
      case PoolType.might:
        return might;
      default:
        assert(false);
        return Stat();
    }
  }

  void updateStat(PoolType pool, Stat stat) {
    switch (pool) {
      case PoolType.intellect:
        intellect = stat;
        break;
      case PoolType.speed:
        speed = stat;
        break;
      case PoolType.might:
        might = stat;
        break;
    }
  }

  void resetAllPools() {
    reset(Stat stat) {
      stat.pool = stat.cap;
    }

    intellect = intellect.rebuild(reset);
    speed = speed.rebuild(reset);
    might = might.rebuild(reset);
  }

  void recoverAllPools({
    int addIntellect = 0,
    int addSpeed = 0,
    int addMight = 0,
  }) {
    if (addIntellect != 0) {
      intellect = intellect.rebuild((stat) {
        stat.pool += addIntellect;
      });
    }
    if (addSpeed != 0) {
      speed = speed.rebuild((stat) {
        stat.pool += addSpeed;
      });
    }
    if (addMight != 0) {
      might = might.rebuild((stat) {
        stat.pool += addMight;
      });
    }
  }
}

extension StatHelper on Stat {
  addToPool(int add) {
    pool += add;
  }
}
