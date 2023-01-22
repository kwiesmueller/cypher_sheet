import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cypherAndArtifactSearchProvider = StateProvider((ref) => "");
final cypherAndArtifactSearchActiveProvider = StateProvider((ref) => false);
final createCypherAndArtifactSelectorActive = StateProvider((ref) => false);

final cypherFilterProvider = StateProvider((ref) => false);

final cyphersProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.cyphers));
});

final filteredCyphersProvider = Provider.family((ref, arg) {
  if (!ref.watch(cypherFilterProvider) && ref.watch(artifactFilterProvider)) {
    return [];
  }
  final search = ref.watch(cypherAndArtifactSearchProvider);
  return ref
      .watch(cyphersProvider)
      .where((element) => element.active == arg)
      .where((element) =>
          search.isEmpty ||
          element.name.contains(search) ||
          element.shortDescription.contains(search) ||
          element.effect.contains(search) ||
          element.internal.contains(search) ||
          element.wearable.contains(search) ||
          element.usable.contains(search))
      .toList(growable: false);
});

final cypherProvider = Provider.autoDispose.family<Cypher, String>((ref, arg) {
  final cyphers = ref.watch(cyphersProvider);
  if (cyphers.isEmpty) {
    return Cypher();
  }
  return cyphers.firstWhere(
    (element) => element.uuid == arg,
    orElse: () => Cypher(),
  );
});

final artifactFilterProvider = StateProvider((ref) => false);

final artifactsProvider = Provider((ref) {
  return ref.watch(characterProvider.select((value) => value.artifacts));
});

final filteredArtifactsProvider =
    Provider.family<List<Artifact>, bool>((ref, arg) {
  if (!ref.watch(artifactFilterProvider) && ref.watch(cypherFilterProvider)) {
    return [];
  }
  final search = ref.watch(cypherAndArtifactSearchProvider);
  return ref
      .watch(artifactsProvider)
      .where((element) => element.active == arg)
      .where((element) =>
          search.isEmpty ||
          element.name.contains(search) ||
          element.shortDescription.contains(search) ||
          element.effect.contains(search) ||
          element.form.contains(search))
      .toList(growable: false);
});

final artifactProvider =
    Provider.autoDispose.family<Artifact, String>((ref, arg) {
  final artifacts = ref.watch(artifactsProvider);
  if (artifacts.isEmpty) {
    return Artifact();
  }
  return artifacts.firstWhere(
    (element) => element.uuid == arg,
    orElse: () => Artifact(),
  );
});
