import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class JZeroInstruction extends Instructions {
  JZeroInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    if (getAkk() != BigInt.zero) return;
    ref.read(reMaSpProvider.notifier).setLabel(instructionParts[1].trim());

    print("JZERO: ${instructionParts[1].trim()}");
  }
}
