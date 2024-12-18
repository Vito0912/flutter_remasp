import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class StoreInstruction extends Instructions {
  StoreInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction(allowNumber: false, returnIndex: true);
    if (!value.isValidInt) {
      throw Exception(
          "This index is too big (Yeah, index is capped at int.max)");
    }
    if (value.toInt() == 0) {
      throw Exception("You can't store a value in register 0");
    }

    ref.read(registerProvider).addValue(value.toInt(), getAkk());

    print("STORE: ${getAkk()} in register ${value}");
  }
}
