import 'dart:collection';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/calendar_settings_provider.dart';
import 'package:kalendae/providers/selected_calendar_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/visible_calendar_month_provider.dart';
import 'home_sections/calendar_events_section.dart';

class HomePage extends ConsumerWidget {
  final _deviceCalendarPlugin = DeviceCalendarPlugin.private();

  // List _calendarEvents = [];
  final container = ProviderContainer();


  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calMonth = ref.watch(visibleCalendarMonthProvider);
    var calendarSettings = ref.watch(calendarSettingsProvider);
    var calendars = ref.watch(selectedCalendarProvider);

    DeviceCalendarPlugin deviceCalendar = DeviceCalendarPlugin.private();
    var events = deviceCalendar.retrieveEvents(
        "6",
        RetrieveEventsParams(
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 365)),
        ));
    deviceCalendar
        .retrieveEvents(
            "6",
            RetrieveEventsParams(
              startDate: DateTime.now(),
              endDate: DateTime.now().add(const Duration(days: 365)),
            ))
        .then((value) => print(value));
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          TableCalendar(
            headerVisible: false,
            startingDayOfWeek:
                _weekdayToStartingDayOfWeek(calendarSettings.firstDayOfWeek),
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
          Divider(),
          Expanded(
            child: CalendarEventsSection()
          ),
        ],
      ),
    ));
  }

  StartingDayOfWeek _weekdayToStartingDayOfWeek(int weekday) {
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

}

