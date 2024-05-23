import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarWidgetStateProvider extends ChangeNotifier {
  DateTime visibleMonth = DateTime.now();
  DateTime selectedDay = DateTime.now();

  void selectDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }

  void setVisibleMonth(DateTime month) {
    visibleMonth = month;
    notifyListeners();
  }
}

final calendarWidgetStateProviderProvider = ChangeNotifierProvider<CalendarWidgetStateProvider>((ref) {
  return CalendarWidgetStateProvider();
});
