import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statsProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.stats));
});

final statProvider = Provider.family<Stat, PoolType>(
  (ref, arg) {
    return ref
        .watch(statsProvider.select((value) => value.getStatForPool(arg)));
  },
);
