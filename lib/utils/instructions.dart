import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Instructions {
  final int lineIndex;
  final List<String> instructionParts;
  final Ref ref;

  Instructions(this.lineIndex, this.instructionParts, this.ref);

  // This returns either
  BigInt getValueOfInstruction({bool allowNumber = true, returnIndex = false}) {
    String value = instructionParts[1];
    if (value.startsWith("#")) {
      if (!allowNumber) {
        throw Exception("# is not allowed here");
      }
      return BigInt.parse(value.substring(1));
    } else if (value.startsWith("*")) {
      return !returnIndex
          ? ref
              .read(registerProvider)
              .getStarValue(int.parse(value.substring(1)))
          : ref.read(registerProvider).getValue(int.parse(value.substring(1)));
    } else if (BigInt.tryParse(value) != null) {
      return returnIndex
          ? BigInt.parse(value)
          : ref.read(registerProvider).getValue(int.parse(value));
    }
    throw Exception("Number could not be parsed - $instructionParts");
  }

  BigInt getAkk() {
    return ref.read(registerProvider).getValue(0);
  }

  void execute();

  @override
  String toString() {
    return 'Instruction: $instructionParts (line: $lineIndex)';
  }
}
