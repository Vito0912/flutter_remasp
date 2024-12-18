import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends ChangeNotifier {
  final Map<int, BigInt> _registers = {};

  void addValue(int key, BigInt value, {bool notify = true}) {
    _registers[key] = value;
    if (notify) notifyListeners();
  }

  void setValues(Map<int, BigInt> values) {
    _registers.clear();
    _registers.addAll(values);
    notifyListeners();
  }

  void removeValue(int key) {
    if (_registers.containsKey(key)) {
      _registers.remove(key);
      notifyListeners();
    }
  }

  void updateValue(int key, BigInt newValue, {bool notify = true}) {
    if (_registers.containsKey(key)) {
      _registers[key] = newValue;
      if (notify) notifyListeners();
    }
  }

  BigInt getStarValue(int key) {
    if (getValue(key).isValidInt) {
      return _registers[getValue(key).toInt()] ?? BigInt.zero;
    }
    throw Exception(
        'Stop Stop Stop. Du darfst hier schon mit BigInts rechnen ;). Aber "unendlich" Register gibt es hier nicht :).');
  }

  BigInt getValue(int key) {
    return _registers[key] ?? BigInt.zero;
  }

  void clearValues({bool notify = true}) {
    _registers.clear();
    if (notify) notifyListeners();
  }

  BigInt getRegisterZero() {
    return _registers[0] ?? BigInt.zero;
  }

  Map<int, BigInt> get values =>
      Map.unmodifiable(_registers); // Provide a read-only view
}

final registerProvider = ChangeNotifierProvider<RegisterNotifier>(
  (ref) => RegisterNotifier(),
);

final registerValueProvider =
    Provider.autoDispose.family<BigInt, int>((ref, index) {
  final registers = ref.watch(registerProvider);

  return registers.values[index] ?? BigInt.zero;
});
