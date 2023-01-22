import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/pool_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final abilitiesProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.abilities));
});

final filteredAbilitiesProvider = Provider((ref) {
  final filter = ref.watch(abilityFilterProvider);
  final search = ref.watch(abilitySearchProvider);

  final abilities = ref
      .watch(abilitiesProvider)
      .where((element) => filter.isActive(element.type))
      // very basic full text search
      .where((element) =>
          search.isEmpty ||
          element.name.contains(search) ||
          element.shortDescription.contains(search) ||
          element.description.contains(search))
      .toList(growable: false);

  abilities.sort((a, b) {
    final typeComparison = a.type.compareTo(b.type);
    if (typeComparison != 0) {
      return typeComparison;
    }

    return a.name.compareTo(b.name);
  });

  return abilities;
});

final abilityFilterProvider =
    StateNotifierProvider<PoolFilterNotifier, PoolFilter>((ref) {
  return PoolFilterNotifier();
});

final abilitySearchActiveProvider = StateProvider((ref) => false);

final abilitySearchProvider = StateProvider((ref) => "");

final abilityProvider =
    Provider.autoDispose.family<Ability, String>((ref, arg) {
  final abilities = ref.watch(abilitiesProvider);
  if (abilities.isEmpty) {
    return Ability();
  }
  return abilities.firstWhere(
    (element) => element.uuid == arg,
    orElse: () => Ability(),
  );
});
