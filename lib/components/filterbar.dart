import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/extensions/item.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/filters/item_filter.dart';
import 'package:cypher_sheet/state/filters/pool_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.filters,
    this.add,
    this.search,
    this.wrap = false,
  });

  final List<Widget> filters;
  final Widget? add;
  final Widget? search;
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (var i = 0; i < filters.length; i++) {
      widgets.add(filters[i]);
      if (i < filters.length - 1 && !wrap) {
        widgets.add(ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 8.0),
        ));
      }
    }

    final utils = <Widget>[
      if (add != null)
        Padding(
          padding: filters.isNotEmpty
              ? const EdgeInsets.only(left: 8.0)
              : EdgeInsets.zero,
          child: add!,
        ),
      if (search != null)
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: search!,
        ),
    ];

    if (wrap) {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          ...widgets,
          ...utils,
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widgets,
        ...utils,
      ],
    );
  }
}

class PoolFilterIcon extends ConsumerWidget {
  const PoolFilterIcon({super.key, required this.type, required this.provider});

  final PoolType type;
  final StateNotifierProvider<PoolFilterNotifier, PoolFilter> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 42.0;
    final filter = ref.watch(provider);
    return SVGBox(
      active: filter.isActive(type) && filter.isAnyPoolActive(),
      icon: type.toIcon(),
      size: iconSize,
      onTap: () {
        ref.read(provider.notifier).toggleFilter(type);
      },
    );
  }
}

class ItemFilterIcon extends ConsumerWidget {
  const ItemFilterIcon(
      {super.key, required this.type, required this.provider, this.size = 42});

  final ItemType type;
  final StateNotifierProvider<ItemFilterNotifier, ItemFilter> provider;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SVGBox(
      active: ref.watch(provider).isTypeActive(type),
      icon: type.toIcon(),
      size: size,
      onTap: () {
        ref.read(provider.notifier).toggleFilter(type);
      },
    );
  }
}
