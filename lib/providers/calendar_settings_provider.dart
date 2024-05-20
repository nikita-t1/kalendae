import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarSettingsModel extends ChangeNotifier {
  bool showCalendarWeeks = false;
  int firstDayOfWeek = DateTime.monday;

  void toggleShowCalendarWeeks() {
    showCalendarWeeks = !showCalendarWeeks;
    notifyListeners();
  }

  void setFirstDayOfWeek(int day) {
    firstDayOfWeek = day;
    notifyListeners();
  }
}


final calendarSettingsProvider = ChangeNotifierProvider<CalendarSettingsModel>((ref) {
  return CalendarSettingsModel();
});
