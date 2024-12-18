import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class JNZeroInstruction extends Instructions {
  JNZeroInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    if (getAkk() == BigInt.zero) return;
    ref.read(reMaSpProvider.notifier).setLabel(instructionParts[1].trim());

    print("JNZERO: ${instructionParts[1].trim()}");
  }
}
