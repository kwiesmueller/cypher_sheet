import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/components/selector.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class CreateAbility extends ConsumerStatefulWidget {
  const CreateAbility({
    super.key,
    this.initialUUID = "",
    this.initialName = "",
    this.initialCost = "",
    this.initialType = PoolType.intellect,
    this.initialEnabler = false,
    this.initialShortDescription = "",
    this.initialDescription = "",
  });

  CreateAbility.fromState(Ability ability, {super.key})
      : initialUUID = ability.uuid,
        initialName = ability.name,
        initialCost = ability.cost,
        initialType = ability.type,
        initialEnabler = ability.enabler,
        initialShortDescription = ability.shortDescription,
        initialDescription = ability.description;

  final String initialUUID;
  final String initialName;
  final String initialCost;
  final PoolType initialType;
  final bool initialEnabler;
  final String initialShortDescription;
  final String initialDescription;

  @override
  ConsumerState<CreateAbility> createState() => _CreateAbilityState();
}

class _CreateAbilityState extends ConsumerState<CreateAbility> {
  late bool isNewAbility;
  late TextEditingController name = TextEditingController();
  late TextEditingController cost = TextEditingController();
  late PoolType type;
  late bool enabler;
  late TextEditingController shortDescription = TextEditingController();
  late TextEditingController description = TextEditingController();

  @override
  void initState() {
    super.initState();
    isNewAbility = widget.initialUUID.isEmpty;
    name.text = widget.initialName;
    cost.text = widget.initialCost;
    type = widget.initialType;
    enabler = widget.initialEnabler;
    shortDescription.text = widget.initialShortDescription;
    description.text = widget.initialDescription;
  }

  @override
  void dispose() {
    name.dispose();
    cost.dispose();
    shortDescription.dispose();
    description.dispose();

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
                "${isNewAbility ? "Create" : "Edit"} Ability",
                align: TextAlign.left,
              ),
              if (!isNewAbility)
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
                            .deleteAbility(widget.initialUUID);
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
        Expanded(
            child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
          DialogTextBox(
            controller: name,
            label: "Name",
            initialValue: name.value.text,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: AppText(
                      "Type",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      align: TextAlign.left,
                    ),
                  ),
                  poolTypeSelectors(),
                ],
              ),
              const SizedBox(
                width: 0.0,
              ),
              Expanded(
                child: DialogTextBox(
                  controller: cost,
                  label: "Cost",
                  initialValue: cost.value.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppCheckbox(
                active: enabler,
                onTap: () {
                  setState(() {
                    enabler = !enabler;
                  });
                },
              ),
              const SizedBox(width: 16.0),
              AppText(
                "Enabler",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                align: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          DialogTextBox(
            controller: shortDescription,
            label: "Short Description",
            initialValue: shortDescription.text,
          ),
          const SizedBox(height: 16.0),
          DialogTextBox(
            controller: description,
            label: "Description",
            initialValue: description.text,
            multiLine: true,
          ),
        ])),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            final ability = Ability(
              uuid: widget.initialUUID,
              name: name.value.text,
              cost: cost.value.text,
              type: type,
              enabler: enabler,
              shortDescription: shortDescription.value.text,
              description: description.value.text,
            );
            if (isNewAbility) {
              ref.read(characterProvider.notifier).addAbility(ability);
            } else {
              ref.read(characterProvider.notifier).updateAbility(ability);
            }
            closeDialog(context);
          }),
          color: Theme.of(context).colorScheme.primary,
          child: AppText(isNewAbility ? "Create" : "Update"),
        ),
      ],
    );
  }

  Widget poolTypeSelectors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...PoolType.values.map(
          (selectorType) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: PoolTypeSelector(
                activeType: type,
                type: selectorType,
                onSelect: (newType) {
                  setState(() {
                    type = newType;
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
