import 'package:cypher_sheet/components/checkbox.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/views/dialogs/edit_character_meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class CreateArtifact extends ConsumerStatefulWidget {
  const CreateArtifact({
    super.key,
    this.uuid = "",
    this.name = "",
    this.level = "",
    this.shortDescription = "",
    this.effect = "",
    this.active = false,
    this.depletion = "",
    this.form = "",
  });

  CreateArtifact.fromState(Artifact artifact, {super.key})
      : uuid = artifact.uuid,
        name = artifact.name,
        level = artifact.level,
        shortDescription = artifact.shortDescription,
        effect = artifact.effect,
        active = artifact.active,
        depletion = artifact.depletion,
        form = artifact.form;

  final String uuid;
  final String name;
  final String level;
  final String shortDescription;
  final String effect;
  final bool active;
  final String depletion;
  final String form;

  @override
  ConsumerState<CreateArtifact> createState() => _CreateAbilityState();
}

class _CreateAbilityState extends ConsumerState<CreateArtifact> {
  late bool isNew;

  late TextEditingController name = TextEditingController();
  late TextEditingController level = TextEditingController();
  late TextEditingController shortDescription = TextEditingController();
  late TextEditingController effect = TextEditingController();
  late bool active;
  final TextEditingController depletion = TextEditingController();
  final TextEditingController form = TextEditingController();

  @override
  void initState() {
    super.initState();

    isNew = widget.uuid.isEmpty;
    name.text = widget.name;
    level.text = widget.level;
    shortDescription.text = widget.shortDescription;
    effect.text = widget.effect;
    active = widget.active;
    depletion.text = widget.depletion;
    form.text = widget.form;
  }

  @override
  void dispose() {
    name.dispose();
    level.dispose();
    shortDescription.dispose();
    effect.dispose();
    depletion.dispose();
    form.dispose();

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
                "${isNew ? "Create" : "Edit"} Artifact",
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
                            .deleteArtifact(widget.uuid);
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
            DialogTextBox(
              controller: shortDescription,
              label: "Short Description",
              initialValue: shortDescription.text,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      constraints: const BoxConstraints.tightFor(width: 64),
                      child: DialogTextBox(
                        controller: level,
                        label: "Level",
                        initialValue: level.value.text,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DialogTextBox(
                    controller: depletion,
                    label: "Depletion",
                    initialValue: depletion.value.text,
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
                  active: active,
                  onTap: () {
                    setState(() {
                      active = !active;
                    });
                  },
                ),
                const SizedBox(width: 16.0),
                AppText(
                  "Active",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  align: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: form,
              label: "Form",
              initialValue: form.text,
              multiLine: true,
            ),
            const SizedBox(height: 16.0),
            DialogTextBox(
              controller: effect,
              label: "Effect",
              initialValue: effect.text,
              multiLine: true,
            ),
          ]),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            final artifact = Artifact(
              name: name.value.text,
              level: level.value.text,
              shortDescription: shortDescription.value.text,
              effect: effect.value.text,
              active: active,
              depletion: depletion.value.text,
              form: form.value.text,
            );
            if (isNew) {
              ref.read(characterProvider.notifier).addArtifact(artifact);
            } else {
              ref.read(characterProvider.notifier).updateArtifact(artifact);
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
