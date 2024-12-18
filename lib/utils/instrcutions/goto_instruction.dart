import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class GotoInstruction extends Instructions {
  GotoInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    ref.read(reMaSpProvider.notifier).setLabel(instructionParts[1].trim());

    print("GOTO: ${instructionParts[1].trim()}");
  }
}
