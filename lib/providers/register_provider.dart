import 'package:flutter/foundation.dart';
import 'package:flutter_remasp/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends ChangeNotifier {
  final Map<int, BigInt> _registers = {};
  int? lastModifiedRegister;

  get lastModified => lastModifiedRegister;

  void clearLastModified() {
    lastModifiedRegister = null;
  }

  void addValue(int key, BigInt value, {bool notify = true}) {
    lastModifiedRegister = key;
    _registers[key] = value;
    if (notify) notifyListeners();
    lastModifiedRegister = key;
  }

  void setValues(Map<int, BigInt> values) {
    _registers.clear();
    _registers.addAll(values);
    notifyListeners();
  }

  void removeValue(int key) {
    if (_registers.containsKey(key)) {
      _registers.remove(key);
      lastModifiedRegister = key;
      notifyListeners();
    }
  }

  void updateValue(int key, BigInt newValue, {bool notify = true}) {
    if (_registers.containsKey(key)) {
      _registers[key] = newValue;
      lastModifiedRegister = key;
      if (notify) notifyListeners();
    }
  }

  BigInt getStarValue(int key) {
    if (getValue(key).isValidInt) {
      lastModifiedRegister = getValue(key).toInt();
      return _registers[getValue(key).toInt()] ?? BigInt.zero;
    }
    throw Exception(S.current.errorRegisterOverflow);
  }

  BigInt getValue(int key) {
    if (key != 0) lastModifiedRegister = key;
    return _registers[key] ?? BigInt.zero;
  }

  void clearValues({bool notify = true}) {
    _registers.clear();
    lastModifiedRegister = null;
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
