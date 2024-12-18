import 'package:flutter_remasp/providers/register_provider.dart';
import 'package:flutter_remasp/utils/instructions.dart';

class LoadInstruction extends Instructions {
  LoadInstruction(super.lineLength, super.content, super.ref);

  @override
  void execute() {
    ref.read(registerProvider).addValue(0, getValueOfInstruction());

    print("LOAD: ${getValueOfInstruction()}");
  }
}
