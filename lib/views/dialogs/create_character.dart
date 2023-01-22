import 'package:cypher_sheet/components/scroll.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/extensions/character.dart';
import 'package:cypher_sheet/extensions/color.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

class CreateCharacter extends ConsumerStatefulWidget {
  const CreateCharacter({
    super.key,
    this.initialName = "Name",
    this.initialDescriptor = "Descriptor",
    this.initialType = "Type",
    this.initialFocus = "Focus",
    this.initialColor,
  });

  CreateCharacter.fromState(Character character, {super.key})
      : initialName = character.name,
        initialDescriptor = character.descriptor,
        initialType = character.type,
        initialFocus = character.focus,
        initialColor = character.color.toColor();

  final String initialName;
  final String initialDescriptor;
  final String initialType;
  final String initialFocus;
  final Color? initialColor;

  @override
  ConsumerState<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends ConsumerState<CreateCharacter> {
  late TextEditingController name = TextEditingController();
  late TextEditingController descriptor = TextEditingController();
  late TextEditingController type = TextEditingController();
  late TextEditingController focus = TextEditingController();
  late Color primaryColor;

  @override
  void initState() {
    super.initState();

    name.text = widget.initialName;
    descriptor.text = widget.initialDescriptor;
    type.text = widget.initialType;
    focus.text = widget.initialFocus;
    primaryColor =
        widget.initialColor ?? const Color.fromRGBO(75, 149, 236, 1.0);
  }

  @override
  void dispose() {
    name.dispose();
    descriptor.dispose();
    type.dispose();
    focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.w600);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: AppScrollView(customPadding: EdgeInsets.zero, slivers: [
          Row(
            children: [
              Expanded(
                child: CharacterCreationTextBox(
                  controller: name,
                  initialValue: name.value.text,
                  textColor: primaryColor,
                ),
              ),
              const SizedBox(width: 14.0),
              AppText("is a", style: labelStyle),
            ],
          ),
          const SizedBox(height: 8.0),
          CharacterCreationTextBox(
            controller: descriptor,
            initialValue: descriptor.text,
            textColor: primaryColor,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: CharacterCreationTextBox(
                  controller: type,
                  initialValue: type.text,
                  textColor: primaryColor,
                ),
              ),
              const SizedBox(width: 14.0),
              AppText("who", style: labelStyle),
            ],
          ),
          const SizedBox(height: 8.0),
          CharacterCreationTextBox(
            controller: focus,
            initialValue: focus.text,
            textColor: primaryColor,
          ),
          const SizedBox(height: 16.0),
          AppText(
            "Select a color for your character",
            style: Theme.of(context).textTheme.displayMedium,
            maxLines: 2,
          ),
          const SizedBox(height: 16.0),
          SlidePicker(
            pickerColor: primaryColor,
            onColorChanged: (color) {
              setState(() {
                primaryColor = color;
              });
            },
            // ignore: deprecated_member_use
            sliderTextStyle: Theme.of(context).textTheme.bodyMedium,
            colorModel: ColorModel.hsl,
            enableAlpha: false,
            displayThumbColor: false,
          ),
        ])),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: (() {
            if (ref.watch(characterProvider).isReady()) {
              ref.read(characterProvider.notifier).updateMetadata(
                  name: name.value.text,
                  descriptor: descriptor.value.text,
                  type: type.value.text,
                  focus: focus.value.text,
                  color: primaryColor);
            } else {
              ref.read(characterProvider.notifier).create(
                  name: name.text,
                  descriptor: descriptor.text,
                  type: type.text,
                  focus: focus.text,
                  color: primaryColor);
            }
            ref.invalidate(characterListProvider);
            closeDialog(context);
          }),
          color: primaryColor,
          child: AppText(
              ref.watch(characterProvider).isReady() ? "Update" : "Create"),
        ),
      ],
    );
  }
}

class CharacterCreationTextBox extends StatelessWidget {
  const CharacterCreationTextBox({
    super.key,
    required this.initialValue,
    required this.textColor,
    required this.controller,
  });

  final String initialValue;
  final Color textColor;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Theme.of(context).colorScheme.surface,
        width: 2.0,
      ))),
      child: AppTextEdit(
        controller: controller,
        flat: true,
        value: initialValue,
        onEditingComplete: (newValue) {},
        customPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        textAlign: TextAlign.left,
        color: textColor,
        maxLines: 2,
        showCursor: true,
      ),
    );
  }
}
