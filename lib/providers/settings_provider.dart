import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsModel extends ChangeNotifier {
  bool darkMode = false;

  void toggleDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

}

final settingsProvider = ChangeNotifierProvider<SettingsModel>((ref) {
  return SettingsModel();
});
