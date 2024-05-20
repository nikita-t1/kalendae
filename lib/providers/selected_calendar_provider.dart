import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCalendarModel extends ChangeNotifier {
  List<int> selectedCalendars = [];
  List<Event?> calendarEvents = [];

  void toggleCalendar(int calendar) {
    if (selectedCalendars.contains(calendar)) {
      selectedCalendars.remove(calendar);
    } else {
      selectedCalendars.add(calendar);
    }
    notifyListeners();
  }

  void addEvent(Event event) {
    calendarEvents.add(event);
    notifyListeners();
  }

  void addEvents(List<Event> events) {
    calendarEvents.addAll(events);
    notifyListeners();
  }

  void removeEvent(Event event) {
    calendarEvents.remove(event);
    notifyListeners();
  }

  void clearEvents() {
    calendarEvents.clear();
    notifyListeners();
  }
}


final selectedCalendarProvider = ChangeNotifierProvider<SelectedCalendarModel>((ref) {
  return SelectedCalendarModel();
});
