import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remasp/globals.dart';
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
                              : () async => {
                                    // Save the current content of textController
                                    await FileSaver.instance.saveAs(
                                      name: 'remasp',
                                      bytes: utf8.encode(textController.text),
                                      ext: '.txt',
                                      mimeType: MimeType.text,
                                    )
                                  }),
                      IconButton(
                          icon: Icon(
                            FluentIcons.open_file,
                            size: 20,
                          ),
                          onPressed: isActive
                              ? null
                              : () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    readSequential: true,
                                    withData: true,
                                    allowedExtensions: ['txt'],
                                  );
                                  if (result != null) {
                                    String? contentText = utf8.decode(result
                                            .files.firstOrNull?.bytes
                                            ?.toList() ??
                                        []);

                                    textController.text = contentText ?? '';
                                  }
                                })
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
