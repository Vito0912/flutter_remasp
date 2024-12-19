import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class DivInstruction extends Instructions {
  DivInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    BigInt value = getValueOfInstruction();
    if (value == BigInt.zero) {
      throw Exception(S.current.errorDivisionByZero);
    }
    ref.read(registerProvider).addValue(0, getAkk() ~/ value);

    print("DIV: ${getAkk() ~/ value}");
  }
}
