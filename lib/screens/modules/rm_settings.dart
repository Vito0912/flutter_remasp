import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show showAboutDialog;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/globals.dart';
import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RmSettings extends HookConsumerWidget {
  RmSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previousState = useState(<int, BigInt>{});
    final reMaSp = ref.watch(reMaSpProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8.0,
                children: [
                  Text(S.of(context).labelMachineControl),
                  // Show Flutter attribution
                  IconButton(
                      icon: Icon(FluentIcons.info),
                      onPressed: () => showAboutDialog(
                              context: context,
                              applicationName: 'Flutter ReMaSp',
                              applicationVersion: '0.1.0',
                              children: [
                                Text('An easy register machine in Flutter.'),
                                Text(
                                    'This program follows the instructions for the "hessisches Landesabitur".'),
                                Text(
                                    'The program was inspired by the project "remasp" by Norman Sutatyo and can be accessed at https://github.com/groehner/Remasp.'),
                                Text(
                                    'License viewable at https://github.com/Vito0912/flutter_remasp/tree/main/java/LICENSE'),
                              ])),
                ],
              ),
              Button(
                  onPressed: reMaSp.isActive()
                      ? () {
                          reMaSp.stopExecution();
                        }
                      : () async {
                          if (textController.text.isEmpty) {
                            throw Exception(S.of(context).errorNoInstructions);
                          }
                          reMaSp.reset();
                          reMaSp.startExecution();
                        },
                  child: reMaSp.isActive()
                      ? Text(S.of(context).labelStopProgram)
                      : Text(S.of(context).labelStartProgram)),
              Button(
                  onPressed: reMaSp.isActive()
                      ? null
                      : () {
                          if (textController.text.isEmpty) {
                            throw Exception(S.of(context).errorNoInstructions);
                          }
                          reMaSp.reset();
                        },
                  child: Text(S.of(context).labelStartSingleStep)),
              Button(
                  onPressed: !reMaSp.isActive()
                      ? null
                      : () {
                          reMaSp.executeInstruction();
                        },
                  child: Row(
                    spacing: 2.0,
                    children: [
                      Text(S.of(context).labelNext),
                      Icon(FluentIcons.chevron_right_end6),
                    ],
                  )),
              Divider(),
              Text(S.of(context).labelRegisterSettings),
              Button(
                  child: Text(S.of(context).labelSaveRegisters),
                  onPressed: () => {
                        previousState.value = ref.read(registerProvider).values
                      }),
              Button(
                  onPressed: previousState.value.isEmpty
                      ? null
                      : () => {
                            ref
                                .read(registerProvider.notifier)
                                .setValues(previousState.value)
                          },
                  child: Text(S.of(context).labelLoadRegisters)),
              Button(
                  child: Text(S.of(context).labelResetRegisters),
                  onPressed: () {
                    ref.read(registerProvider.notifier).clearValues();
                    reMaSp.stopExecution();
                  }),
              Divider(),
              HookBuilder(builder: (context) {
                final speedHook = useState(speed);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).labelTimePerInstruction(
                        speedHook.value.inMilliseconds)),
                    Slider(
                        min: 0,
                        max: 2000,
                        value: speedHook.value.inMilliseconds.toDouble(),
                        divisions: 40,
                        onChanged: (
                          double value,
                        ) {
                          if (value == 0) {
                            return;
                          }
                          speed = Duration(milliseconds: value.toInt());
                          speedHook.value = speed;
                        })
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
