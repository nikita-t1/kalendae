import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';

class SelectedCalendarModel extends ChangeNotifier {
  String calendarsJson = localStorage.getItem("calendars") ?? "[]";
  late List<int> selectedCalendars = List<int>.from(jsonDecode(calendarsJson));

  // List<int> selectedCalendars = [];

  void toggleCalendar(int calendar) {
    if (selectedCalendars.contains(calendar)) {
      selectedCalendars.remove(calendar);
    } else {
      selectedCalendars.add(calendar);
    }
    localStorage.setItem("calendars", jsonEncode(selectedCalendars));
    notifyListeners();
  }
}

final selectedCalendarProvider =
    ChangeNotifierProvider<SelectedCalendarModel>((ref) {
  return SelectedCalendarModel();
});
