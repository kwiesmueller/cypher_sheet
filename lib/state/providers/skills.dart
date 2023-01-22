import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/extensions/skill.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/pool_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skillSearchProvider = StateProvider((ref) => "");
final skillSearchActiveProvider = StateProvider((ref) => false);

final skillFilterProvider =
    StateNotifierProvider<PoolFilterNotifier, PoolFilter>((ref) {
  return PoolFilterNotifier();
});

final skillsProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.skills));
});

final filteredSkillsProvider = Provider((ref) {
  final filter = ref.watch(skillFilterProvider);
  final search = ref.watch(skillSearchProvider);
  final skills = ref
      .watch(skillsProvider)
      .where((element) => filter.isActive(element.type))
      .where((element) =>
          search.isEmpty ||
          element.name.contains(search) ||
          element.description.contains(search) ||
          element.type.toLabel().contains(search))
      .toList(growable: false);

  skills.sort((a, b) {
    final typeComparison = a.type.compareTo(b.type);
    if (typeComparison != 0) {
      return typeComparison;
    }

    final levelComparison = a.level.compareTo(b.level);
    if (levelComparison != 0) {
      return levelComparison;
    }

    return a.name.compareTo(b.name);
  });

  return skills;
});

final skillProvider = Provider.autoDispose.family<Skill, String>((ref, arg) {
  final skills = ref.watch(skillsProvider);
  if (skills.isEmpty) {
    return Skill();
  }
  return skills.firstWhere(
    (element) => element.uuid == arg,
    orElse: () => Skill(),
  );
});
