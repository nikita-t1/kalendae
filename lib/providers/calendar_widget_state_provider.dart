import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarWidgetSelectedDayStateProvider extends ChangeNotifier {
  DateTime selectedDay = DateTime.now();

  void selectDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }

}

class CalendarWidgetVisibleMonthStateProvider extends ChangeNotifier {
  DateTime visibleMonth = DateTime.now();

  void setVisibleMonth(DateTime month) {
    visibleMonth = month;
    notifyListeners();
  }
}

final calendarWidgetVisibleMonthStateProvider = ChangeNotifierProvider<CalendarWidgetVisibleMonthStateProvider>((ref) {
  return CalendarWidgetVisibleMonthStateProvider();
});

final calendarWidgetSelectedDayStateProvider = ChangeNotifierProvider<CalendarWidgetSelectedDayStateProvider>((ref) {
  return CalendarWidgetSelectedDayStateProvider();
});
