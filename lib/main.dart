import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/providers/locale_provider.dart';
import 'package:flutter_remasp/screens/register_machine.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'globals.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _showErrorToUser(details.exceptionAsString());
    };

    final currentUrl = window.location.href;
    final Uri uri = Uri.parse(currentUrl);
    final String? text = uri.queryParameters['text'];
    if (text != null) {
      // Convert base64 string to utf8 and set it to textController
      textController.text = utf8.decode(base64.decode(text));
    }

    textController.addListener(() {
      final input = utf8.encode(textController.text);
      final base64UrlStr = base64Url.encode(input);
      final url = Uri.parse(window.location.href)
          .replace(queryParameters: {"text": base64UrlStr});
      window.history.pushState({}, '', url.toString());
    });

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {
    _showErrorToUser(error.toString());
    throw error;
  });
}

Future<void> _showErrorToUser(String message) async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final context = navigatorKey.currentState?.context;
    if (context == null) {
      return;
    }

    // Get the current context
    await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: Text(S.current.errorAnErrorOccurred),
        content: Text(
          message,
        ),
        actions: [
          FilledButton(
            child: Text(S.current.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks([
        "Remasp"
      ], 'Copyright (c) 2017, Norman Sutatyo\nAll rights reserved. \n \nRedistribution and use in source and binary forms, with or without \nmodification, are permitted provided that the following conditions are met: \n \n* Redistributions of source code must retain the above copyright notice, this \n list of conditions and the following disclaimer. \n \n* Redistributions in binary form must reproduce the above copyright notice, \n this list of conditions and the following disclaimer in the documentation \n and/or other materials provided with the distribution. \n \n* Neither the name of the copyright holder nor the names of its \n contributors may be used to endorse or promote products derived from \n this software without specific prior written permission. \n \nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" \nAND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE \nIMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE \nDISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE \nFOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL \nDAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR \nSERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER \nCAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, \nOR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE \nOF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          // Check if `Ctrl+S` or `Meta+S` (on macOS) is pressed
          bool isSaveShortcut = (RawKeyboard.instance.keysPressed
                      .contains(LogicalKeyboardKey.controlLeft) ||
                  RawKeyboard.instance.keysPressed
                      .contains(LogicalKeyboardKey.metaLeft)) &&
              event.logicalKey == LogicalKeyboardKey.keyS;

          if (isSaveShortcut) {
            // Call the custom save URL shortcut method
            _saveUrlShortcut();
          }
        }
      },
      child: material.MaterialApp(
        theme: material.ThemeData(
          primarySwatch: material.Colors.blue,
          brightness: material.Brightness.dark,
        ),
        localizationsDelegates: const [S.delegate],
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: Consumer(builder: (context, ref, child) {
          return FluentApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: const [S.delegate],
            locale: Locale(ref.watch(localeProvider)),
            debugShowCheckedModeBanner: false,
            title: S.of(context).labelTitle,
            theme: FluentThemeData(
              accentColor: Colors.blue,
              scaffoldBackgroundColor: Colors.black,
              brightness: Brightness.dark,
            ),
            darkTheme: FluentThemeData(
              accentColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            themeMode: ThemeMode.dark,
            home: RegisterMachine(),
          );
        }),
      ),
    );
  }

  void _saveUrlShortcut() {
    final currentUrl = window.location.href;

    final urlFileContent = "[InternetShortcut]\nURL=$currentUrl";

    final blob = Blob([urlFileContent], 'text/plain', 'native');
    final url = Url.createObjectUrlFromBlob(blob);

    final anchor = AnchorElement(href: url)
      ..target = "blank"
      ..download = "shortcut.url" // The file name
      ..click();

    Url.revokeObjectUrl(url);
  }
}
