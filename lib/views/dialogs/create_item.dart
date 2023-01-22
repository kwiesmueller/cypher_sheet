import 'package:cypher_sheet/components/equipment.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/extensions/item.dart';
import 'package:cypher_sheet/state/filters/item_filter.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/providers/inventories.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class CreateItem extends ConsumerStatefulWidget {
  const CreateItem({
    super.key,
    required this.path,
    this.name = "",
    this.shortDescription = "",
    this.description = "",
    this.types = const [],
    this.amount = 1.0,
    this.value = 0.0,
    this.subItemType,
    this.armor,
  });

  CreateItem.fromState(Item item, {super.key})
      : path = item.path,
        name = item.name,
        shortDescription = item.shortDescription,
        description = item.description,
        types = item.types,
        amount = item.amount,
        subItemType = item.hasSubItemType() ? item.subItemType : null,
        value = item.value,
        armor = item.hasArmor() ? item.armor : null;

  final ItemPath path;
  final String name;
  final String shortDescription;
  final String description;
  final List<ItemType> types;
  final double amount;
  final double value;
  final ItemType? subItemType;
  final int? armor;

  @override
  ConsumerState<CreateItem> createState() => _CreateAbilityState();
}

class _CreateAbilityState extends ConsumerState<CreateItem> {
  late bool isNew;

  late TextEditingController name = TextEditingController();
  late TextEditingController shortDescription = TextEditingController();
  late TextEditingController description = TextEditingController();
  late TextEditingController amount = TextEditingController();
  late TextEditingController value = TextEditingController();
  late ItemFilter types;
  late ItemType? subItemType;
  late TextEditingController armor = TextEditingController();
  late String inventory;

  @override
  void initState() {
    super.initState();

    isNew = widget.path.self.isEmpty;
    name.text = widget.name;
    shortDescription.text = widget.shortDescription;
    description.text = widget.description;
    types = ItemFilter(activeTypes: widget.types);
    amount.text = removeZeroDecimals(widget.amount).toString();
    value.text = removeZeroDecimals(widget.value).toString();
    subItemType = widget.subItemType;
    armor.text = widget.armor != null ? widget.armor.toString() : "";
    inventory = widget.path.inventory;
  }

  @override
  void dispose() {
    name.dispose();
    shortDescription.dispose();
    description.dispose();
    amount.dispose();
    value.dispose();
    armor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                "${isNew ? "Create" : "Edit"} Item",
                align: TextAlign.left,
              ),
              if (!isNew)
                AppBox(
                    flat: true,
                    padding: 2,
                    onTap: () {
                      showConfirmDialog(
                          context,
                          AppText(
                            "Permanently delete\n${name.value.text}",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelLarge,
                          ), () {
                        ref
                            .read(characterProvider.notifier)
                            .deleteItem(widget.path.self);
                        closeDialog(context);
                        closeDialog(context);
                      });
                    },
                    child: const AppIcon(
                      AppIcons.deleteForever,
                      size: 24,
                    )),
            ],
          ),
        ),
        const AppLabel(
          text: "Inventory",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SVGBox(
                icon: AppIcons.self,
                active: inventory == inventoryNameSelf,
                onTap: () {
                  setState(() {
                    inventory = inventoryNameSelf;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SVGBox(
                icon: AppIcons.backpack,
                active: inventory == inventoryNameBackpack,
                onTap: () {
                  setState(() {
                    inventory = inventoryNameBackpack;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SVGBox(
                icon: AppIcons.home,
                active: inventory == inventoryNameHome,
                onTap: () {
                  setState(() {
                    inventory = inventoryNameHome;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
            DialogTextBox(
              controller: name,
              label: "Name",
              initialValue: name.value.text,
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: shortDescription,
              label: "Short Description",
              initialValue: shortDescription.text,
            ),
            const SizedBox(height: 16.0),
            Wrap(
              runSpacing: 8.0,
              spacing: 8.0,
              children: ItemType.values
                  .map((e) => SVGBoxLabeled(
                        icon: e.toIcon(),
                        label: e.toLabel(),
                        active: types.isTypeActive(e),
                        iconSize: 26,
                        customLabelStyle:
                            Theme.of(context).textTheme.labelLarge,
                        onTap: () {
                          setState(() {
                            types = types.toggleFilter(e);
                          });
                        },
                      ))
                  .toList(growable: false),
            ),
            const SizedBox(height: 16.0),
            if (types.isTypeActive(ItemType.armor))
              DialogTextBox(
                controller: armor,
                label: "Armor Bonus",
                initialValue: armor.text,
              ),
            if (types.isTypeActive(ItemType.armor))
              const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: DialogTextBox(
                      controller: amount,
                      label: "Amount / Count",
                      initialValue: amount.text,
                    ),
                  ),
                ),
                Expanded(
                  child: DialogTextBox(
                    controller: value,
                    label: "Value",
                    initialValue: value.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: description,
              label: "Description",
              initialValue: description.text,
              multiLine: true,
            ),
            const SizedBox(height: 16.0),
            const AppLabel(text: "Sub Item Type"),
            Wrap(
              runSpacing: 8.0,
              spacing: 8.0,
              children: [
                SVGBoxLabeled(
                  icon: AppIcons.none,
                  label: "None",
                  iconSize: 26,
                  customLabelStyle: Theme.of(context).textTheme.labelLarge,
                  onTap: () {
                    setState(() {
                      subItemType = null;
                    });
                  },
                  active: subItemType == null,
                ),
                ...ItemType.values
                    .map((e) => SVGBoxLabeled(
                          icon: e.toIcon(),
                          label: e.toLabel(),
                          active: subItemType == e,
                          iconSize: 26,
                          customLabelStyle:
                              Theme.of(context).textTheme.labelLarge,
                          onTap: () {
                            setState(() {
                              subItemType = e;
                            });
                          },
                        ))
                    .toList(growable: false)
              ],
            ),
          ]),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            final hasMoved = widget.path.inventory.isNotEmpty &&
                widget.path.inventory != inventory;
            final path = ItemPath(
              inventory: inventory.isEmpty ? widget.path.inventory : inventory,
              parent: widget.path.parent,
              self: widget.path.self,
            );
            final item = Item(
              path: path,
              name: name.value.text,
              shortDescription: shortDescription.value.text,
              description: description.value.text,
              types: types.activeTypes.isNotEmpty
                  ? types.activeTypes
                  : [ItemType.others],
              amount: amount.value.text.isNotEmpty
                  ? double.parse(amount.value.text)
                  : 1,
              value: value.value.text.isNotEmpty
                  ? double.parse(value.value.text)
                  : 0,
              armor: armor.value.text.isNotEmpty
                  ? int.tryParse(armor.value.text)
                  : null,
              subItemType: subItemType,
            );
            if (isNew) {
              ref.read(characterProvider.notifier).addItem(item);
            } else if (hasMoved) {
              ref.read(characterProvider.notifier).moveItem(item);
            } else {
              ref.read(characterProvider.notifier).updateItem(item);
            }
            closeDialog(context);
          }),
          color: Theme.of(context).colorScheme.primary,
          child: AppText(isNew ? "Create" : "Update"),
        ),
      ],
    );
  }
}
