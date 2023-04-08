import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/label.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/extensions/item.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/inventories.dart';
import 'package:cypher_sheet/views/dialogs/object/item/editable.dart';
import 'package:flutter/material.dart';

class ItemEditInputs extends StatelessWidget {
  const ItemEditInputs(this.edit, this.setState, {super.key});

  final EditableItem edit;
  final Function(Function()) setState;

  // TODO: figure out how to do the custom header for inventory selection etc.

  @override
  Widget build(BuildContext context) {
    return AppScrollView(customPadding: EdgeInsets.zero, slivers: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SVGBox(
              icon: AppIcons.self,
              active: edit.path.inventory == inventoryNameSelf,
              onTap: () {
                setState(() {
                  edit.path.inventory = inventoryNameSelf;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SVGBox(
              icon: AppIcons.backpack,
              active: edit.path.inventory == inventoryNameBackpack,
              onTap: () {
                setState(() {
                  edit.path.inventory = inventoryNameBackpack;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SVGBox(
              icon: AppIcons.home,
              active: edit.path.inventory == inventoryNameHome,
              onTap: () {
                setState(() {
                  edit.path.inventory = inventoryNameHome;
                });
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.name,
        label: "Name",
        initialValue: edit.name.value.text,
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.shortDescription,
        label: "Short Description",
        initialValue: edit.shortDescription.text,
      ),
      const SizedBox(height: 16.0),
      Wrap(
        runSpacing: 8.0,
        spacing: 8.0,
        children: ItemType.values
            .map((e) => SVGBoxLabeled(
                  icon: e.toIcon(),
                  label: e.toLabel(),
                  active: edit.types.isTypeActive(e),
                  iconSize: 26,
                  customLabelStyle: Theme.of(context).textTheme.labelLarge,
                  onTap: () {
                    setState(() {
                      edit.types = edit.types.toggleFilter(e);
                    });
                  },
                ))
            .toList(growable: false),
      ),
      const SizedBox(height: 16.0),
      if (edit.types.isTypeActive(ItemType.armor))
        DialogTextBox(
          controller: edit.armor,
          label: "Armor Bonus",
          initialValue: edit.armor.text,
        ),
      if (edit.types.isTypeActive(ItemType.armor)) const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DialogTextBox(
                controller: edit.amount,
                label: "Amount / Count",
                initialValue: edit.amount.text,
              ),
            ),
          ),
          Expanded(
            child: DialogTextBox(
              controller: edit.value,
              label: "Value",
              initialValue: edit.value.text,
            ),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      DialogTextBox(
        controller: edit.description,
        label: "Description",
        initialValue: edit.description.text,
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
                edit.subItemType = null;
              });
            },
            active: edit.subItemType == null,
          ),
          ...ItemType.values
              .map((e) => SVGBoxLabeled(
                    icon: e.toIcon(),
                    label: e.toLabel(),
                    active: edit.subItemType == e,
                    iconSize: 26,
                    customLabelStyle: Theme.of(context).textTheme.labelLarge,
                    onTap: () {
                      setState(() {
                        edit.subItemType = e;
                      });
                    },
                  ))
              .toList(growable: false)
        ],
      ),
    ]);
  }
}
