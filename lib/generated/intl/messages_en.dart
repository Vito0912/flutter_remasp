// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(line, instruction) =>
      "Invalid instruction in line ${line}: ${instruction}";

  static String m1(label) => "The label ${label} already exists.";

  static String m2(label) =>
      "The label ${label} was not found. Please check your instructions.";

  static String m3(instruction) =>
      "The instruction could not be parsed. Please check your instructions. Faulty instruction chain: ${instruction}";

  static String m4(time) => "Time per Instruction: ${time}ms";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "errorAnErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An error occurred."),
        "errorBehindLabelInstruction": MessageLookupByLibrary.simpleMessage(
            "An instruction must follow a label."),
        "errorDivisionByZero": MessageLookupByLibrary.simpleMessage(
            "Division by 0 is not allowed."),
        "errorInvalidInstruction": m0,
        "errorLabelAlreadyExists": m1,
        "errorMissingLabel": m2,
        "errorNoInstructions": MessageLookupByLibrary.simpleMessage(
            "No instructions available. You must add at least one instruction!"),
        "errorNoInstructionsRunning": MessageLookupByLibrary.simpleMessage(
            "There are no instructions to execute, and the END command was not found."),
        "errorNotAllowedToWriteTo0": MessageLookupByLibrary.simpleMessage(
            "You are not allowed to STORE in register 0."),
        "errorNotParseable": m3,
        "errorNumberLoadingNotAllowed": MessageLookupByLibrary.simpleMessage(
            "You are not allowed to use a constant as an operand for STORE."),
        "errorRegisterOverflow": MessageLookupByLibrary.simpleMessage(
            "Register overflow - You should never reach this value :)"),
        "labelLoadRegisters":
            MessageLookupByLibrary.simpleMessage("Load Registers"),
        "labelMachineControl":
            MessageLookupByLibrary.simpleMessage("Machine Control"),
        "labelNext": MessageLookupByLibrary.simpleMessage("Next"),
        "labelRegisterSettings":
            MessageLookupByLibrary.simpleMessage("Register Settings"),
        "labelResetRegisters":
            MessageLookupByLibrary.simpleMessage("Clear Registers"),
        "labelSaveRegisters":
            MessageLookupByLibrary.simpleMessage("Save Registers"),
        "labelStartProgram":
            MessageLookupByLibrary.simpleMessage("Start Program"),
        "labelStartSingleStep":
            MessageLookupByLibrary.simpleMessage("Start Single-Step Mode"),
        "labelStopProgram":
            MessageLookupByLibrary.simpleMessage("Stop Program"),
        "labelTimePerInstruction": m4,
        "labelTitle": MessageLookupByLibrary.simpleMessage("Register Machine")
      };
}
