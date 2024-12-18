import 'package:flutter_remasp/providers/remasp_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class EndInstruction extends Instructions {
  EndInstruction(super.lineLength, super.instructionParts, super.ref);

  @override
  execute() {
    ref.read(reMaSpProvider.notifier).stopExecution();
  }
}
