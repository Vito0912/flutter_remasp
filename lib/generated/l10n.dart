// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Registermaschine`
  String get labelTitle {
    return Intl.message(
      'Registermaschine',
      name: 'labelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Starte Programm`
  String get labelStartProgram {
    return Intl.message(
      'Starte Programm',
      name: 'labelStartProgram',
      desc: '',
      args: [],
    );
  }

  /// `Starte Einzelschrittmodus`
  String get labelStartSingleStep {
    return Intl.message(
      'Starte Einzelschrittmodus',
      name: 'labelStartSingleStep',
      desc: '',
      args: [],
    );
  }

  /// `Weiter`
  String get labelNext {
    return Intl.message(
      'Weiter',
      name: 'labelNext',
      desc: '',
      args: [],
    );
  }

  /// `Stoppe Programm`
  String get labelStopProgram {
    return Intl.message(
      'Stoppe Programm',
      name: 'labelStopProgram',
      desc: '',
      args: [],
    );
  }

  /// `Register leeren`
  String get labelResetRegisters {
    return Intl.message(
      'Register leeren',
      name: 'labelResetRegisters',
      desc: '',
      args: [],
    );
  }

  /// `Register laden`
  String get labelLoadRegisters {
    return Intl.message(
      'Register laden',
      name: 'labelLoadRegisters',
      desc: '',
      args: [],
    );
  }

  /// `Register zwischenspeichern`
  String get labelSaveRegisters {
    return Intl.message(
      'Register zwischenspeichern',
      name: 'labelSaveRegisters',
      desc: '',
      args: [],
    );
  }

  /// `Zeit pro Befehl: {time}ms`
  String labelTimePerInstruction(Object time) {
    return Intl.message(
      'Zeit pro Befehl: ${time}ms',
      name: 'labelTimePerInstruction',
      desc: '',
      args: [time],
    );
  }

  /// `Maschinensteuerung`
  String get labelMachineControl {
    return Intl.message(
      'Maschinensteuerung',
      name: 'labelMachineControl',
      desc: '',
      args: [],
    );
  }

  /// `Registereinstellungen`
  String get labelRegisterSettings {
    return Intl.message(
      'Registereinstellungen',
      name: 'labelRegisterSettings',
      desc: '',
      args: [],
    );
  }

  /// `Ein Fehler ist aufgetreten.`
  String get errorAnErrorOccurred {
    return Intl.message(
      'Ein Fehler ist aufgetreten.',
      name: 'errorAnErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Schließen`
  String get close {
    return Intl.message(
      'Schließen',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Keine Befehle vorhanden. Du musst mindestens einen Befehl hinzufügen!`
  String get errorNoInstructions {
    return Intl.message(
      'Keine Befehle vorhanden. Du musst mindestens einen Befehl hinzufügen!',
      name: 'errorNoInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Registerüberlauf - Du solltest diesen Wert nie erreichen :)`
  String get errorRegisterOverflow {
    return Intl.message(
      'Registerüberlauf - Du solltest diesen Wert nie erreichen :)',
      name: 'errorRegisterOverflow',
      desc: '',
      args: [],
    );
  }

  /// `Das Label {label} wurde nicht gefunden. Bitte überprüfe deine Befehle.`
  String errorMissingLabel(Object label) {
    return Intl.message(
      'Das Label $label wurde nicht gefunden. Bitte überprüfe deine Befehle.',
      name: 'errorMissingLabel',
      desc: '',
      args: [label],
    );
  }

  /// `Es sind keine Befehle zum Ausführen vorhanden und der END Befehl wurde nicht gefunden.`
  String get errorNoInstructionsRunning {
    return Intl.message(
      'Es sind keine Befehle zum Ausführen vorhanden und der END Befehl wurde nicht gefunden.',
      name: 'errorNoInstructionsRunning',
      desc: '',
      args: [],
    );
  }

  /// `Du darfst nicht in Register 0 STOREn.`
  String get errorNotAllowedToWriteTo0 {
    return Intl.message(
      'Du darfst nicht in Register 0 STOREn.',
      name: 'errorNotAllowedToWriteTo0',
      desc: '',
      args: [],
    );
  }

  /// `Division durch 0 ist nicht erlaubt.`
  String get errorDivisionByZero {
    return Intl.message(
      'Division durch 0 ist nicht erlaubt.',
      name: 'errorDivisionByZero',
      desc: '',
      args: [],
    );
  }

  /// `Du darfst keine Konstante als Operand für STORE benutzen.`
  String get errorNumberLoadingNotAllowed {
    return Intl.message(
      'Du darfst keine Konstante als Operand für STORE benutzen.',
      name: 'errorNumberLoadingNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Der Befehl konnte nicht geparst werden. Bitte überprüfe deine Befehle. Fehlerhafte Befehlskette: {instruction}`
  String errorNotParseable(Object instruction) {
    return Intl.message(
      'Der Befehl konnte nicht geparst werden. Bitte überprüfe deine Befehle. Fehlerhafte Befehlskette: $instruction',
      name: 'errorNotParseable',
      desc: '',
      args: [instruction],
    );
  }

  /// `Das Label {label} ist doppelt vorhanden.`
  String errorLabelAlreadyExists(Object label) {
    return Intl.message(
      'Das Label $label ist doppelt vorhanden.',
      name: 'errorLabelAlreadyExists',
      desc: '',
      args: [label],
    );
  }

  /// `Ein Befehl muss hinter einem Label stehen.`
  String get errorBehindLabelInstruction {
    return Intl.message(
      'Ein Befehl muss hinter einem Label stehen.',
      name: 'errorBehindLabelInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Ungültiger Befehl in Zeile {line}: {instruction}`
  String errorInvalidInstruction(Object line, Object instruction) {
    return Intl.message(
      'Ungültiger Befehl in Zeile $line: $instruction',
      name: 'errorInvalidInstruction',
      desc: '',
      args: [line, instruction],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
