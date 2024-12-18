import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class MulInstruction extends Instructions {
  MulInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction();
    ref.read(registerProvider).addValue(0, value * getAkk());

    print("MUL: ${value * getAkk()}");
  }
}
