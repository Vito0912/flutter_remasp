import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_remasp/screens/register_machine.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _showErrorToUser(details.exceptionAsString());
    };

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
        title: const Text('Ein Fehler ist aufgetreten'),
        content: Text(
          message,
        ),
        actions: [
          FilledButton(
            child: const Text('Schließen'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return material.MaterialApp(
      theme: material.ThemeData(
        primarySwatch: material.Colors.blue,
        brightness: material.Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: FluentApp(
        navigatorKey: navigatorKey,
        title: 'Registermaschinensimulationsprogramm',
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
      ),
    );
  }
}
