import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_remasp/globals.dart';
import 'package:flutter_remasp/utils/instructions.dart';
import 'package:flutter_remasp/utils/remasp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReMaSpNotifier extends ChangeNotifier {
  final Map<String, List<Instructions>> instructions = {};
  ReMaSp? remasp;
  String currentLabel = "default";
  int currentInstructionIndex = 0;
  final Ref<ReMaSpNotifier> ref;
  Timer? timer;

  ReMaSpNotifier(this.ref);

  bool isActive() {
    return remasp != null;
  }

  void reset() {
    instructions.clear();
    remasp = ReMaSp(textController.text, ref);
    ref.read(isActiveProvider.notifier).setActive(true);
    instructions.addAll(remasp!.instructions);
    currentLabel = "default";
    currentInstructionIndex = 0;
    notifyListeners();
  }

  Instructions? getCurrentInstruction() {
    if (instructions.containsKey(currentLabel)) {
      return instructions[currentLabel]![currentInstructionIndex];
    }
    return null;
  }

  void setInstruction(Map<String, List<Instructions>> instructions) {
    this.instructions.clear();
    this.instructions.addAll(instructions);
    currentLabel = "default";
    notifyListeners();
  }

  void setLabel(String label) {
    if (!instructions.containsKey(label)) {
      print("Available labels: ${instructions.keys}");
      throw Exception(S.current.errorMissingLabel(label));
    }
    currentLabel = label;
    currentInstructionIndex = -1;
    notifyListeners();
  }

  void executeInstruction() {
    if (instructions.containsKey(currentLabel)) {
      try {
        instructions[currentLabel]![currentInstructionIndex].execute();
      } catch (e) {
        stopExecution();
        rethrow;
      }
      if (remasp != null) nextInstruction();
    } else {
      stopExecution();
      throw Exception(S.current.errorMissingLabel(currentLabel));
    }
  }

  void startExecution() async {
    // Create a Timer that executes the nextInstruction method every 1 second
    timer = Timer.periodic(speed, (timer) {
      executeInstruction();
    });
  }

  void stopExecution() {
    remasp = null;
    timer?.cancel();
    ref.read(isActiveProvider.notifier).setActive(false);
    instructions.clear();
    currentLabel = "default";
    currentInstructionIndex = 0;
    notifyListeners();
  }

  void nextInstruction() {
    if (instructions.containsKey(currentLabel)) {
      if (currentInstructionIndex < instructions[currentLabel]!.length - 1) {
        currentInstructionIndex++;
        notifyListeners();
      } else {
        // Go to next label
        final labels = instructions.keys.toList();
        final currentIndex = labels.indexOf(currentLabel);
        if (currentIndex < labels.length - 1) {
          currentLabel = labels[currentIndex + 1];
          currentInstructionIndex = 0;
          notifyListeners();
        } else {
          stopExecution();
          throw Exception(S.current.errorNoInstructionsRunning);
        }
      }
    } else {
      stopExecution();
      throw Exception(S.current.errorMissingLabel(currentLabel));
    }
  }
}

final reMaSpProvider = ChangeNotifierProvider<ReMaSpNotifier>(
  (ref) => ReMaSpNotifier(ref),
);

class IsActiveNotifier extends StateNotifier<bool> {
  IsActiveNotifier() : super(false);

  void setActive(bool active) {
    state = active;
  }
}

final isActiveProvider = StateNotifierProvider<IsActiveNotifier, bool>((ref) {
  return IsActiveNotifier();
});
