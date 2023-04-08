import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/extensions/item.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/providers/items.dart';
import 'package:cypher_sheet/views/dialogs/object/item/view.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/cypher.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double equipmentItemDefaultPadding = 12;
const double equipmentItemDefaultSpacing = 4;
const double equipmentItemDefaultBorderRadius = 12;
const double equipmentSubItemBorderRadius = 4;
const double equipmentSubItemSpacing = 3.0;

const String virtualItemUUID = "<virtual>";

class EquipmentItem extends ConsumerStatefulWidget {
  const EquipmentItem(
    this.path, {
    super.key,
    this.virtualItem,
  });

  EquipmentItem.virtual(
    Item item, {
    super.key,
    required String inventory,
  })  : virtualItem = item,
        path = ItemPath(inventory: inventory, self: virtualItemUUID);

  final ItemPath path;
  final Item? virtualItem;

  @override
  ConsumerState<EquipmentItem> createState() => _EquipmentItemState();
}

class _EquipmentItemState extends ConsumerState<EquipmentItem> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    final item =
        widget.virtualItem ?? ref.watch(itemProvider(widget.path.self));

    if (item == null) {
      return const AppBox(child: AppText("Unknown Item"));
    }

    final bool acceptsSubItems = item.hasSubItemType() ||
        ref.watch(subItemsProvider(widget.path.self)).isNotEmpty;
    List<Widget> subItemWidgets = List.empty(growable: true);

    if (item.types.contains(ItemType.material) &&
        widget.path.self == virtualItemUUID) {
      subItemWidgets.addAll(ref
          .watch(filteredItemsProvider(widget.path.inventory))
          .where((element) => element.types.contains(ItemType.material))
          .map((e) => SubItem(e.path)));
    } else {
      subItemWidgets.addAll(ref
          .watch(subItemsProvider(item.path.self))
          .map((e) => SubItem(e.path)));
    }

    if (!expanded) {
      return buildItemHeader(context, item, acceptsSubItems);
    }

    return Column(
      children: [
        buildItemHeader(context, item, acceptsSubItems),
        ...subItemWidgets,
        if (acceptsSubItems)
          AddEquipmentSubItem(
              parent: item.path,
              type: item.subItemType,
              text: item.hasSubItemType()
                  ? "Add ${item.subItemType.toLabel()} ..."
                  : "Add..."),
      ],
    );
  }

  Widget buildItemHeader(BuildContext context, Item item, bool hasSubItems) {
    return Padding(
      padding: hasSubItems
          ? const EdgeInsets.only(
              top: equipmentItemDefaultSpacing,
              bottom: equipmentSubItemSpacing,
            )
          : const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          showAppDialog(context, ViewItem(uuid: widget.path.self));
        },
        child: Container(
          decoration: mainItemDecoration(context, hasSubItems),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: equipmentItemDefaultPadding,
                  right: 10,
                  top: equipmentItemDefaultPadding,
                  bottom: item.shortDescription.isNotEmpty ? 4.0 : 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      item.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Row(
                      children: item.types
                          .map((type) => AppIcon(
                                type.toIcon(),
                                size: 20,
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: hasSubItems ? 2.0 : equipmentItemDefaultPadding,
                  right: hasSubItems ? 3.0 : equipmentItemDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (item.shortDescription.isNotEmpty || hasSubItems)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: equipmentItemDefaultPadding,
                            right: equipmentItemDefaultPadding,
                            bottom: hasSubItems ? 8.0 : 0,
                          ),
                          child: CypherShortDescriptionText(
                            description: item.shortDescription,
                          ),
                        ),
                      ),
                    if (hasSubItems)
                      SVGBox(
                        icon: expanded ? AppIcons.up : AppIcons.down,
                        padding: 0,
                        size: 34,
                        onTap: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration mainItemDecoration(BuildContext context, bool hasSubItems) {
    BorderRadiusGeometry? customBorderRadius;
    if (hasSubItems && expanded) {
      customBorderRadius = const BorderRadius.vertical(
        top: Radius.circular(equipmentItemDefaultBorderRadius),
        bottom: Radius.circular(equipmentSubItemBorderRadius),
      );
    }
    return appBoxDecoration(
      context,
      borderRadius: equipmentItemDefaultBorderRadius,
      customBorderRadius: customBorderRadius,
    );
  }
}

class AddEquipmentSubItem extends ConsumerStatefulWidget {
  const AddEquipmentSubItem({
    super.key,
    required this.text,
    required this.parent,
    required this.type,
  });

  final String text;
  final ItemPath parent;
  final ItemType type;

  @override
  ConsumerState<AddEquipmentSubItem> createState() =>
      _AddEquipmentSubItemState();
}

class _AddEquipmentSubItemState extends ConsumerState<AddEquipmentSubItem> {
  final TextEditingController add = TextEditingController();

  @override
  void initState() {
    super.initState();
    add.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    void addItem() {
      if (add.value.text.isEmpty || add.value.text == widget.text) {
        return;
      }
      ref.read(characterProvider.notifier).addItem(Item(
            path: ItemPath(
                inventory: widget.parent.inventory, parent: widget.parent.self),
            name: add.value.text,
            types: [widget.type],
            amount: 1,
          ));
      setState(() {
        add.text = widget.text;
      });
    }

    return Padding(
      padding: const EdgeInsets.only(
          top: equipmentSubItemSpacing, bottom: equipmentItemDefaultSpacing),
      child: Container(
        decoration: appBoxDecoration(
          context,
          customBorderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(equipmentItemDefaultBorderRadius),
            top: Radius.circular(equipmentSubItemBorderRadius),
          ),
        ),
        constraints: const BoxConstraints(maxHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: equipmentItemDefaultPadding,
                    vertical: 0.0,
                  ),
                  child: AppTextEdit(
                    value: widget.text,
                    controller: add,
                    padding: 0,
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.left,
                    onEditingComplete: (newValue) {
                      addItem();
                    },
                    showCursor: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0, top: 4, bottom: 4),
              child: SVGBox(
                icon: AppIcons.add,
                flat: true,
                padding: 0,
                onTap: addItem,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EquipmentSubItemSeparator extends StatelessWidget {
  const EquipmentSubItemSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 6,
    );
  }
}

class SubItem extends ConsumerWidget {
  const SubItem(this.path, {super.key});

  final ItemPath path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(path.self));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: equipmentSubItemSpacing),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: equipmentSubItemSpacing),
                child: AppBox(
                  padding: 0,
                  borderRadius: equipmentSubItemBorderRadius,
                  onTap: () {
                    showAppDialog(context, ViewItem(uuid: item.path.self));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: equipmentItemDefaultPadding,
                      ),
                      child: AppText(
                        item.name,
                        style: Theme.of(context).textTheme.labelLarge,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ...amountControls(context, ref, item),
          ],
        ),
      ),
    );
  }

  List<Widget> amountControls(BuildContext context, WidgetRef ref, Item item) {
    return [
      SubItemAmountControlIcon(
          icon: AppIcons.remove,
          side: AxisDirection.left,
          onTap: () {
            ref.read(characterProvider.notifier).addItemAmount(item, -1);
          }),
      SubItemAmountText(path: item.path),
      SubItemAmountControlIcon(
          icon: AppIcons.add,
          side: AxisDirection.right,
          onTap: () {
            ref.read(characterProvider.notifier).addItemAmount(item, 1);
          }),
    ];
  }
}

num removeZeroDecimals(double val) {
  if (val % 1 == 0) {
    return val.toInt();
  }
  return val;
}

class SubItemAmountControlIcon extends StatelessWidget {
  const SubItemAmountControlIcon({
    super.key,
    required this.icon,
    this.side = AxisDirection.up,
    required this.onTap,
  });

  final AppIcons icon;
  final AxisDirection side;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: side == AxisDirection.right ? equipmentSubItemSpacing : 0,
        right: side == AxisDirection.left ? equipmentSubItemSpacing : 0,
      ),
      child: SVGBox(
        onTap: onTap,
        icon: icon,
        padding: 2,
        size: 38,
        borderRadius: equipmentSubItemBorderRadius,
      ),
    );
  }
}

class SubItemAmountText extends ConsumerWidget {
  const SubItemAmountText({super.key, required this.path});

  final ItemPath path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(path.self));
    return AppBox(
      borderRadius: equipmentSubItemBorderRadius,
      padding: 0,
      fit: BoxFit.contain,
      child: AppTextEdit(
        constraints: const BoxConstraints(minWidth: 20, maxWidth: 32),
        customPadding: const EdgeInsets.symmetric(horizontal: 4),
        onEditingComplete: (newValue) {
          ref
              .read(characterProvider.notifier)
              .updateItemAmount(item, double.parse(newValue));
        },
        value: removeZeroDecimals(item.amount).toString(),
        textStyle:
            Theme.of(context).textTheme.labelMedium!.copyWith(height: 1.2),
        textAlign: TextAlign.center,
        textInputType: TextInputType.number,
        maxLines: 1,
        flat: true,
      ),
    );
  }
}
