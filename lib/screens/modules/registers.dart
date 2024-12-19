import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remasp/globals.dart';
import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Registers extends StatelessWidget {
  const Registers({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final values = ref.watch(registerProvider);

        return ListView.builder(itemBuilder: (BuildContext context, int index) {
          final value = values.values[index] ?? BigInt.zero;

          final TextEditingController controller =
              TextEditingController(text: value.toString());

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? theme.acrylicBackgroundColor
                      : Color(0xFF383838),
                  // First register rounded corners
                  borderRadius: index == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(
                    children: [
                      index == 0 ? Text("Akk") : Text("$index"),
                      SizedBox(width: 10),
                      Expanded(
                          child: SizedBox(
                              height: 22,
                              child: TextBox(
                                controller: controller,
                                style: TextStyle(fontSize: 12),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                padding:
                                    EdgeInsets.only(left: 4, top: 4, right: 2),
                                onChanged: (value) =>
                                    updateValue(controller, ref, index),
                                onTap: () => controller.selection =
                                    TextSelection(
                                        baseOffset: 0,
                                        extentOffset:
                                            controller.value.text.length),
                              ))),
                    ],
                  ),
                ),
              ),
              if (index == values.lastModified)
                FutureBuilder(
                    future:
                        Future.delayed(Duration(milliseconds: 0), () => false),
                    initialData: true,
                    builder: (context, snapshot) {
                      final bool isVisible = snapshot.data ?? true;

                      return AnimatedOpacity(
                        duration: Duration(
                            milliseconds: (speed.inMilliseconds * 1.5).toInt()),
                        opacity: isVisible ? 1 : 0,
                        child: Container(
                          height: 24,
                          color: Colors.yellowAccent.withValues(alpha: 0.2),
                        ),
                      );
                    }),
            ],
          );
        });
      },
    );
  }

  void updateValue(controller, ref, index) {
    final newValue = controller.text;
    final bigInt = BigInt.tryParse(newValue) ?? BigInt.zero;
    ref.read(registerProvider.notifier).addValue(index, bigInt, notify: false);
  }
}
