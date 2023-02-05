import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/text.dart';

class NumberChip extends StatelessWidget {
  const NumberChip({super.key, required this.value, this.label});

  final int value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            constraints: const BoxConstraints(minWidth: 60),
            decoration: appBoxDecoration(context, borderRadius: 20),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: AppText(value.toString()),
            ),
          ),
        ),
        if (label != null)
          AppText(
            label!,
            align: TextAlign.left,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
      ],
    );
  }
}

class NumberEdit extends StatelessWidget {
  const NumberEdit({
    required this.label,
    super.key,
    this.initialValue = 0,
    required this.onEditingComplete,
  });

  final String label;
  final int initialValue;
  final Function(int) onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AppText(
            label,
            align: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: AppTextEdit(
              textInputType: TextInputType.number,
              value: initialValue.toString(),
              startFocused: true,
              onEditingComplete: (newValue) =>
                  onEditingComplete(int.tryParse(newValue) ?? 0)),
        )
      ],
    );
  }
}

class NumberSelector extends StatefulWidget {
  const NumberSelector({
    super.key,
    required this.add,
    required this.remove,
    this.addLabel = "Add",
    this.removeLabel = "Remove",
  });

  final Function(int value) add;
  final Function(int value) remove;
  final String addLabel;
  final String removeLabel;

  @override
  State<StatefulWidget> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  TextEditingController currentValue = TextEditingController();
  FocusNode addTextBoxFocus = FocusNode(canRequestFocus: true);
  final PageController controller = PageController(viewportFraction: 0.19);
  // int _currentValue = 1;

  @override
  void initState() {
    super.initState();

    currentValue.text = "1";
    currentValue.addListener(() {
      if (currentValue.value.text.isEmpty) {
        return;
      }
      final value = int.tryParse(currentValue.value.text) ?? 1;
      if (value < 1) {
        return;
      }
      if (!controller.hasClients) {
        return;
      }
      if (!addTextBoxFocus.hasFocus) {
        return;
      }
      final newPage = value - 1;
      if (controller.page == newPage) {
        return;
      }
      controller.jumpToPage(value - 1);
    });
  }

  @override
  void dispose() {
    currentValue.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberSelectorButton(
                onTap: (() {
                  widget.add(int.tryParse(currentValue.value.text) ?? 0);
                  controller.jumpToPage(0);
                }),
                color: Theme.of(context).colorScheme.primary,
                label: widget.addLabel,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: AppBox(
                    child: Align(
                      alignment: Alignment.center,
                      child: AppTextEdit(
                        value: currentValue.text,
                        controller: currentValue,
                        onEditingComplete: (newValue) {},
                        focusNode: addTextBoxFocus,
                        startFocused: false,
                      ),
                    ),
                  ),
                ),
              ),
              NumberSelectorButton(
                onTap: (() {
                  widget.remove(
                      (int.tryParse(currentValue.value.text) ?? 0) * -1);
                  controller.jumpToPage(0);
                }),
                color: Theme.of(context).colorScheme.error,
                label: widget.removeLabel,
              ),
            ],
          ),
        ),
        const SizedBox(width: 28.0),
        Expanded(
          child: AppBox(
            padding: 0,
            child: NumberSelectorList(
              controller: controller,
              onValueChange: (value) {
                setState(() {
                  if (addTextBoxFocus.hasFocus) {
                    return;
                  }
                  currentValue.text = value.toString();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class NumberSelectorButton extends StatelessWidget {
  const NumberSelectorButton(
      {super.key, required this.label, required this.onTap, this.color});

  final String label;
  final Color? color;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return AppBox(
      onTap: onTap,
      padding: 8.0,
      color: color ?? Theme.of(context).colorScheme.surface,
      child: AppText(
        label,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class NumberSelectorList extends StatefulWidget {
  const NumberSelectorList({
    super.key,
    this.onValueChange,
    required this.controller,
    this.lowestNumber = 1,
    this.highestNumber = 60,
  });

  final Function(int value)? onValueChange;
  final PageController controller;
  final int lowestNumber;
  final int highestNumber;

  @override
  State<StatefulWidget> createState() => _NumberSelectorListState();
}

class _NumberSelectorListState extends State<NumberSelectorList> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(8)),
              height: 42,
            ),
          ),
        ),
        PageView.builder(
          scrollDirection: Axis.vertical,
          controller: widget.controller,
          onPageChanged: (value) {
            if (widget.onValueChange != null) {
              widget.onValueChange!(value + widget.lowestNumber);
            }
            setState(() => _index = value);
          },
          padEnds: true,
          itemCount: widget.highestNumber + 1,
          itemBuilder: ((context, index) {
            final label = index + widget.lowestNumber;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppBox(
                flat: true,
                padding: 0,
                borderRadius: 8,
                onTapGesture: () {
                  widget.controller.jumpToPage(index);
                },
                child: Center(
                  child: AppText(
                    label.toString(),
                    style: index == _index
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Color.fromRGBO(
                                255,
                                255,
                                255,
                                // render a gradient going away from the selected number
                                ((index - _index) * (index - _index) * -0.18),
                              ),
                            ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
