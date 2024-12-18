import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class AddInstruction extends Instructions {
  AddInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction();
    ref.read(registerProvider).addValue(0, value + getAkk());

    print("ADD: ${value + getAkk()}");
  }
}
