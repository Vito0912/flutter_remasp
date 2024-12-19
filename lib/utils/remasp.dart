import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/utils/instrcutions/add_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/div_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/end_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/goto_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/jnzero_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/jzero_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/load_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/mul_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/store_instruction.dart';
import 'package:flutter_remasp/utils/instrcutions/sub_instruction.dart';
import 'package:flutter_remasp/utils/instructions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReMaSp {
  final String code;
  final Ref ref;
  final Map<String, List<Instructions>> instructions = {"default": []};

  ReMaSp(this.code, this.ref) {
    final lines = code.split('\n');
    var currentLabel = "default";

    // Regex to check if the line contains a label
    // .*:{1}.*
    final labelRegex = RegExp(r'.*:');

    for (var i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      if (line.isEmpty) {
        continue;
      }

      if (labelRegex.hasMatch(lines[i])) {
        currentLabel = lines[i].split(":")[0].trim();

        // Check if currentLabel is already in the map
        if (instructions.containsKey(currentLabel)) {
          //
          throw Exception(S.current.errorLabelAlreadyExists(currentLabel));
        }

        // Add the instruction to the map
        instructions[currentLabel] = [];

        line = lines[i].split(":")[1].trim();

        if (line.isEmpty) {
          throw Exception(S.current.errorBehindLabelInstruction);
        }
      }
      instructions[currentLabel]!.add(parseInstruction(i, line));
    }

    print(instructions);
  }

  List<String> getInstructionName(String line, {bool lowerCase = true}) {
    if (lowerCase) line = line.toLowerCase();
    List<String> parts = line.split(" ");

    // Remove empty parts
    parts.removeWhere((element) => element.isEmpty);

    if ((parts.length <= 1 || parts.length > 2) &&
        (parts[0].toLowerCase() != "end" &&
            (parts.length > 2 &&
                !parts[2].trim().toLowerCase().contains("//")))) {
      throw Exception(
          S.current.errorInvalidInstruction(line, parts.toString()));
    }
    if (parts.length > 2) {
      // Remove everything after second part (comments)
      parts.removeRange(2, parts.length);
    }
    return parts;
  }

  Instructions parseInstruction(int lineIndex, String line) {
    List<String> instructionParts = getInstructionName(line);

    switch (instructionParts[0].toLowerCase()) {
      case "load":
        return LoadInstruction(lineIndex, instructionParts, ref);
      case "store":
        return StoreInstruction(lineIndex, instructionParts, ref);
      case "add":
        return AddInstruction(lineIndex, instructionParts, ref);
      case "sub":
        return SubInstruction(lineIndex, instructionParts, ref);
      case "div":
        return DivInstruction(lineIndex, instructionParts, ref);
      case "mul":
        return MulInstruction(lineIndex, instructionParts, ref);
      case "end":
        return EndInstruction(lineIndex, instructionParts, ref);
      case "goto":
        return GotoInstruction(
            lineIndex, getInstructionName(line, lowerCase: false), ref);
      case "jzero":
        return JZeroInstruction(
            lineIndex, getInstructionName(line, lowerCase: false), ref);
      case "jnzero":
        return JNZeroInstruction(
            lineIndex, getInstructionName(line, lowerCase: false), ref);
    }

    throw Exception(S.current
        .errorInvalidInstruction(lineIndex, instructionParts.toString()));
  }
}
