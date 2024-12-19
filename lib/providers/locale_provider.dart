import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier() : super('de');

  void setLocale(String locale) {
    state = locale;
  }

  void toggle() {
    state = state == 'de' ? 'en' : 'de';
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, String>((ref) {
  return LocaleNotifier();
});
