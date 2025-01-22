import 'dart:html';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remasp/globals.dart';
import 'package:flutter_remasp/providers/locale_provider.dart';
import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/screens/modules/registers.dart';
import 'package:flutter_remasp/screens/modules/rm_input_field.dart';
import 'package:flutter_remasp/screens/modules/rm_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterMachine extends StatelessWidget {
  const RegisterMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentTheme(
      data: FluentTheme.of(context).copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      child: ScaffoldPage(
        header: null,
        padding: EdgeInsets.zero,
        content: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Consumer(builder: (context, ref, child) {
                  final isActive = ref.watch(isActiveProvider);

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(
                            FluentIcons.file_code,
                            size: 20,
                          ),
                          onPressed: isActive
                              ? null
                              : () => {
                                    textController.text = '',
                                  }),
                      IconButton(
                          icon: Icon(
                            FluentIcons.save,
                            size: 20,
                          ),
                          onPressed: isActive
                              ? null
                              : () async {
                                  // Save the current content of textController
                                  // Copy current URL to clipboard
                                  final url = window.location.href;
                                  await Clipboard.setData(
                                      ClipboardData(text: url));
                                  // Show a dialog to the user
                                  showDialog(
                                    context: context,
                                    builder: (context) => ContentDialog(
                                      title: Text('URL copied to clipboard'),
                                      content: Text(
                                          'The current URL has been copied to your clipboard.'),
                                      actions: [
                                        Button(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          FluentIcons.locale_language,
                          size: 20,
                        ),
                        onPressed: () {
                          ref.read(localeProvider.notifier).toggle();
                        },
                      )
                    ],
                  );
                }),
              ),
              HookBuilder(builder: (context) {
                final currentIndex = useState(0);
                final update = useState(false);
                return SizedBox();
                return FluentTheme(
                  data: FluentTheme.of(context),
                  child: TabView(
                    tabs: texts
                        .map((e) => Tab(
                              body: Text(e),
                              text: Text(e),
                              icon: Icon(FluentIcons.folder),
                            ))
                        .toList(),
                    currentIndex: currentIndex.value,
                    onChanged: (index) => currentIndex.value = index,
                    onNewPressed: () {
                      texts.add('Test');
                      update.value = !update.value;
                    },
                    onReorder: (oldIndex, newIndex) {
                      final item = texts.removeAt(oldIndex);
                      texts.insert(newIndex, item);
                      update.value = !update.value;
                    },
                  ),
                );
              }),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: HookBuilder(builder: (BuildContext context) {
                        final ValueNotifier<double> offset = useState(100.0);

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Input field
                            Expanded(
                              child: RmInputField(),
                            ),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    double newWidth =
                                        offset.value - details.delta.dx;
                                    if (newWidth > 100 && newWidth < 500) {
                                      offset.value = newWidth;
                                    }
                                  },
                                  child: SizedBox(
                                    width: 10,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.resizeColumn,
                                    ),
                                  ),
                                ),

                                // Register Column
                                SizedBox(
                                    width: offset.value, child: Registers()),

                                // Register Control
                                RmSettings(),
                              ],
                            )
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
