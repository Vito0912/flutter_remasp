import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remasp/globals.dart';
import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RmInputField extends StatelessWidget {
  const RmInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(builder: (BuildContext context, WidgetRef ref, child) {
          final reMaSp = ref.watch(reMaSpProvider);

          if (!textScrollController.hasClients) {
            return SizedBox();
          }

          Instructions? currentInstruction = reMaSp.getCurrentInstruction();
          if (currentInstruction != null) {
            return AnimatedBuilder(
              animation: textScrollController,
              builder: (BuildContext context, Widget? child) {
                double offset = 6;
                offset += (19 * currentInstruction.lineIndex);
                offset -= textScrollController.position.pixels;

                if (offset >= 0) {
                  return Container(
                    margin: EdgeInsets.only(top: offset),
                    height: 16,
                    color: Colors.yellow.withValues(alpha: 0.4),
                  );
                }
                return SizedBox();
              },
            );
          }

          return SizedBox();
        }),
        Consumer(builder: (BuildContext context, WidgetRef ref, child) {
          final isActive = ref.watch(isActiveProvider);

          return Builder(builder: (context) {
            return Focus(
              onKey: (FocusNode node, RawKeyEvent event) {
                // Detect the key down event and check for the Tab key.
                if (event is RawKeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.tab) {
                  // Insert the tab character manually into the text at the cursor position.
                  final TextEditingValue value = textController.value;
                  final int cursorPos = value.selection.start;

                  if (cursorPos < 0) return KeyEventResult.ignored;

                  // Move the cursor to the right of the tab character.

                  // Update the controller's value to include the tab character.
                  textController.value = value.copyWith(
                    text: value.text.replaceRange(cursorPos, cursorPos, ' '),
                    selection: TextSelection.collapsed(offset: cursorPos + 1),
                  );
                  textController.value = value.copyWith(
                    text: value.text.replaceRange(cursorPos, cursorPos, ' '),
                    selection: TextSelection.collapsed(offset: cursorPos + 1),
                  );
                  textController.value = value.copyWith(
                    text: value.text.replaceRange(cursorPos, cursorPos, ' '),
                    selection: TextSelection.collapsed(offset: cursorPos + 1),
                  );
                  textController.value = value.copyWith(
                    text: value.text.replaceRange(cursorPos, cursorPos, ' '),
                    selection: TextSelection.collapsed(offset: cursorPos + 1),
                  );

                  return KeyEventResult
                      .handled; // Indicate the event was handled.
                }

                return KeyEventResult.ignored; // Let other events through.
              },
              child: TextBox(
                readOnly: isActive,
                maxLines: null,
                autofocus: true,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.top,
                controller: textController,
                scrollController: textScrollController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                expands: true,
                style: FluentTheme.of(context).dialogTheme.bodyStyle,
                placeholder: "",
              ),
            );
          });
        })
      ],
    );
  }
}
