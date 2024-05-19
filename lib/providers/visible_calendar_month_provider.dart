import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisibleCalendarMonthProvider extends ChangeNotifier {
  DateTime visibleMonth = DateTime.now();

  void selectMonth(DateTime month) {
    if (visibleMonth.toIso8601String() == month.toIso8601String()) return;
    visibleMonth = month;
    notifyListeners();
  }
}

final visibleCalendarMonthProvider = ChangeNotifierProvider<VisibleCalendarMonthProvider>((ref) {
  return VisibleCalendarMonthProvider();
});
