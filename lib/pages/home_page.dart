import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/calendar_settings_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/visible_calendar_month_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calMonth = ref.watch(visibleCalendarMonthProvider);
    var calendarSettings = ref.watch(calendarSettingsProvider);

    return Scaffold(
      body: TableCalendar(
        headerVisible: false,
        startingDayOfWeek: weekdayToStartingDayOfWeek(calendarSettings.firstDayOfWeek),
        sixWeekMonthsEnforced: true,
        onPageChanged: (focusedDay) => calMonth.selectMonth(focusedDay),
        firstDay: DateTime.utc(1970),
        lastDay: DateTime.utc(2038, 1, 18),
        focusedDay: calMonth.visibleMonth,
        // onDaySelected: (selectedDay, focusedDay) => calMonth.selectMonth(selectedDay),
        weekNumbersVisible: calendarSettings.showCalendarWeeks,
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

StartingDayOfWeek weekdayToStartingDayOfWeek(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return StartingDayOfWeek.monday;
    case DateTime.tuesday:
      return StartingDayOfWeek.tuesday;
    case DateTime.wednesday:
      return StartingDayOfWeek.wednesday;
    case DateTime.thursday:
      return StartingDayOfWeek.thursday;
    case DateTime.friday:
      return StartingDayOfWeek.friday;
    case DateTime.saturday:
      return StartingDayOfWeek.saturday;
    case DateTime.sunday:
      return StartingDayOfWeek.sunday;
    default:
      return StartingDayOfWeek.sunday;
  }
}
