import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCalendarModel extends ChangeNotifier {
  List<int> selectedCalendars = [];

  void toggleCalendar(int calendar) {
    if (selectedCalendars.contains(calendar)) {
      selectedCalendars.remove(calendar);
    } else {
      selectedCalendars.add(calendar);
    }
    notifyListeners();
  }

}


final selectedCalendarProvider = ChangeNotifierProvider<SelectedCalendarModel>((ref) {
  return SelectedCalendarModel();
});
