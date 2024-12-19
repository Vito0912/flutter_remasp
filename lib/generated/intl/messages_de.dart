// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static String m0(line, instruction) =>
      "Ungültiger Befehl in Zeile ${line}: ${instruction}";

  static String m1(label) => "Das Label ${label} ist doppelt vorhanden.";

  static String m2(label) =>
      "Das Label ${label} wurde nicht gefunden. Bitte überprüfe deine Befehle.";

  static String m3(instruction) =>
      "Der Befehl konnte nicht geparst werden. Bitte überprüfe deine Befehle. Fehlerhafte Befehlskette: ${instruction}";

  static String m4(time) => "Zeit pro Befehl: ${time}ms";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "close": MessageLookupByLibrary.simpleMessage("Schließen"),
        "errorAnErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Ein Fehler ist aufgetreten."),
        "errorBehindLabelInstruction": MessageLookupByLibrary.simpleMessage(
            "Ein Befehl muss hinter einem Label stehen."),
        "errorDivisionByZero": MessageLookupByLibrary.simpleMessage(
            "Division durch 0 ist nicht erlaubt."),
        "errorInvalidInstruction": m0,
        "errorLabelAlreadyExists": m1,
        "errorMissingLabel": m2,
        "errorNoInstructions": MessageLookupByLibrary.simpleMessage(
            "Keine Befehle vorhanden. Du musst mindestens einen Befehl hinzufügen!"),
        "errorNoInstructionsRunning": MessageLookupByLibrary.simpleMessage(
            "Es sind keine Befehle zum Ausführen vorhanden und der END Befehl wurde nicht gefunden."),
        "errorNotAllowedToWriteTo0": MessageLookupByLibrary.simpleMessage(
            "Du darfst nicht in Register 0 STOREn."),
        "errorNotParseable": m3,
        "errorNumberLoadingNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Du darfst keine Konstante als Operand für STORE benutzen."),
        "errorRegisterOverflow": MessageLookupByLibrary.simpleMessage(
            "Registerüberlauf - Du solltest diesen Wert nie erreichen :)"),
        "labelLoadRegisters":
            MessageLookupByLibrary.simpleMessage("Register laden"),
        "labelMachineControl":
            MessageLookupByLibrary.simpleMessage("Maschinensteuerung"),
        "labelNext": MessageLookupByLibrary.simpleMessage("Weiter"),
        "labelRegisterSettings":
            MessageLookupByLibrary.simpleMessage("Registereinstellungen"),
        "labelResetRegisters":
            MessageLookupByLibrary.simpleMessage("Register leeren"),
        "labelSaveRegisters":
            MessageLookupByLibrary.simpleMessage("Register zwischenspeichern"),
        "labelStartProgram":
            MessageLookupByLibrary.simpleMessage("Starte Programm"),
        "labelStartSingleStep":
            MessageLookupByLibrary.simpleMessage("Starte Einzelschrittmodus"),
        "labelStopProgram":
            MessageLookupByLibrary.simpleMessage("Stoppe Programm"),
        "labelTimePerInstruction": m4,
        "labelTitle": MessageLookupByLibrary.simpleMessage("Registermaschine")
      };
}
