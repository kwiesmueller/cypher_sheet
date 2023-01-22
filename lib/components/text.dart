import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cypher_sheet/components/box.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    this.style,
    this.align = TextAlign.center,
    this.maxLines = 1,
    this.overflow = TextOverflow.fade,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final TextAlign align;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style != null
          ? style!.copyWith(height: 1)
          : const TextStyle(height: 1),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: false,
      textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: false,
          leadingDistribution: TextLeadingDistribution.even),
    );
  }
}

class AppTextEdit extends ConsumerStatefulWidget {
  const AppTextEdit({
    super.key,
    this.label,
    required this.value,
    required this.onEditingComplete,
    this.textInputType = TextInputType.text,
    this.flat = false,
    this.startFocused = false,
    this.startWithFullTextSelected = true,
    this.padding,
    this.customPadding,
    this.textAlign = TextAlign.center,
    this.labelAlign = TextAlign.center,
    this.color,
    this.maxLines = 1,
    this.minLines = 1,
    this.showCursor = false,
    this.controller,
    this.textStyle,
    this.constraints,
    this.focusNode,
  });

  final String value;
  final String? label;
  final Function(String) onEditingComplete;
  final TextInputType textInputType;
  final bool flat;
  final bool startFocused;
  final bool startWithFullTextSelected;
  final double? padding;
  final EdgeInsetsGeometry? customPadding;
  final TextAlign textAlign;
  final TextAlign labelAlign;
  final Color? color;
  final int? maxLines;
  final int? minLines;
  final bool showCursor;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final BoxConstraints? constraints;
  final FocusNode? focusNode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTextEditState();
}

class _AppTextEditState extends ConsumerState<AppTextEdit> {
  bool editingEnabled = false;
  late FocusNode focusNode;
  late TextEditingController controller;
  late bool shouldDisposeController;
  late bool shouldDisposeFocusNode;
  late String valueWhenCreated;

  void enableEditing() {
    editingEnabled = true;
  }

  void stopEditing() {
    // don't do anything if we already stopped editing
    if (!editingEnabled) {
      return;
    }
    widget.onEditingComplete(controller.text);
    focusNode.unfocus();
    editingEnabled = false;
    controller.clearComposing();
  }

  @override
  void initState() {
    super.initState();
    valueWhenCreated = widget.value;
    shouldDisposeController = widget.controller == null;
    shouldDisposeFocusNode = widget.focusNode == null;
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode(canRequestFocus: true);

    if (widget.startFocused) {
      setState(() {
        enableEditing();
      });
    }
    controller.text = widget.value;

    if (widget.startFocused) {
      focusNode.requestFocus();
    }
    if (widget.startWithFullTextSelected) {
      controller.selection =
          TextSelection(baseOffset: 0, extentOffset: controller.text.length);
    }

    focusNode.addListener(() {
      setState(() {
        if (!focusNode.hasPrimaryFocus) {
          stopEditing();
        }
      });
    });
  }

  @override
  void dispose() {
    if (shouldDisposeFocusNode) {
      focusNode.dispose();
    }
    if (shouldDisposeController) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (editingEnabled) {
      if (widget.startWithFullTextSelected) {
        controller.selection =
            TextSelection(baseOffset: 0, extentOffset: controller.text.length);
      }
    } else if (!focusNode.hasPrimaryFocus) {
      // allow updates of the value if we get it from the parent
      // but don't reset to the original value on every render
      // if the value was changed once though, reset valueWhenCreated to
      // enable back and fourths
      if (widget.value != valueWhenCreated) {
        valueWhenCreated = widget.value;
        controller.text = widget.value;
      }
      focusNode.unfocus();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: widget.labelAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AppText(
              widget.label!,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              align: widget.labelAlign,
            ),
          ),
        Flexible(
          fit: FlexFit.loose,
          child: AppBox(
            constraints: widget.constraints,
            padding: widget.padding ?? 16.0,
            customPadding: widget.customPadding,
            flat: widget.flat,
            child: TextField(
              onTap: () {
                if (!editingEnabled) {
                  setState(() {
                    enableEditing();
                  });
                }
              },
              textAlign: widget.textAlign,
              style: widget.textStyle ??
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: widget.color,
                        height: 1.0,
                      ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                focusColor: Colors.transparent,
                fillColor: Colors.transparent,
              ),
              cursorWidth: widget.showCursor ? 2.0 : 0,
              showCursor: widget.showCursor,
              expands: false,
              focusNode: focusNode,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              keyboardType: widget.textInputType,
              controller: controller,
              textInputAction: widget.textInputType == TextInputType.multiline
                  ? TextInputAction.newline
                  : TextInputAction.done,
              onEditingComplete: () {
                setState(() {
                  stopEditing();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
