import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class StoreInstruction extends Instructions {
  StoreInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction(allowNumber: false, returnIndex: true);
    if (!value.isValidInt) {
      throw Exception(S.current.errorRegisterOverflow);
    }
    if (value.toInt() == 0) {
      throw Exception(S.current.errorNotAllowedToWriteTo0);
    }

    ref.read(registerProvider).addValue(value.toInt(), getAkk());

    print("STORE: ${getAkk()} in register ${value}");
  }
}
