import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class SubInstruction extends Instructions {
  SubInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction();
    BigInt akk = getAkk();

    BigInt subtractedValue = akk - value;
    if ((akk - value) < BigInt.zero) {
      subtractedValue = BigInt.zero;
    }

    ref.read(registerProvider).addValue(0, subtractedValue);

    print("SUB: ${subtractedValue}");
  }
}
