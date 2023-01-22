import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoolFilter {
  const PoolFilter({
    this.intellect = false,
    this.speed = false,
    this.might = false,
  });

  final bool intellect;
  final bool speed;
  final bool might;

  bool isAnyPoolActive() {
    return intellect || speed || might;
  }

  bool isActive(PoolType type) {
    if (!isAnyPoolActive()) {
      return true;
    }
    switch (type) {
      case PoolType.intellect:
        return intellect;
      case PoolType.speed:
        return speed;
      case PoolType.might:
        return might;
      default:
        assert(false);
        return false;
    }
  }
}

class PoolFilterNotifier extends StateNotifier<PoolFilter> {
  PoolFilterNotifier() : super(const PoolFilter());

  void toggleFilter(PoolType type) {
    switch (type) {
      case PoolType.intellect:
        state = PoolFilter(
          intellect: !state.intellect,
          speed: state.speed,
          might: state.might,
        );
        break;
      case PoolType.speed:
        state = PoolFilter(
          intellect: state.intellect,
          speed: !state.speed,
          might: state.might,
        );
        break;
      case PoolType.might:
        state = PoolFilter(
          intellect: state.intellect,
          speed: state.speed,
          might: !state.might,
        );
        break;
      default:
        assert(false);
    }
  }
}
