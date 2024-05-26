import 'dart:collection';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalendae/pages/home_sections/calendar_table_section.dart';
import 'package:kalendae/pages/home_sections/daily_summary_section.dart';
import 'package:kalendae/providers/calendar_events_provider.dart';
import 'package:kalendae/providers/calendar_settings_provider.dart';
import 'package:kalendae/providers/selected_calendar_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/calendar_widget_state_provider.dart';
import 'home_sections/calendar_events_section.dart';

class HomePage extends ConsumerWidget {
  final _deviceCalendarPlugin = DeviceCalendarPlugin.private();

  // List _calendarEvents = [];
  final container = ProviderContainer();


  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleMonthState = ref.watch(calendarWidgetVisibleMonthStateProvider);
    var selectedDayState = ref.watch(calendarWidgetSelectedDayStateProvider);
    final calendarEventsAsyncValue = ref.watch(calendarEventsProvider);

    var calendarSettings = ref.watch(calendarSettingsProvider);
    var calendars = ref.watch(selectedCalendarProvider);
    // final calendarEventsAsyncValue = ref.watch(calendarEventsProvider(calendarState));


    DeviceCalendarPlugin deviceCalendar = DeviceCalendarPlugin.private();
    var monthEvents = calendarEventsAsyncValue.valueOrNull ?? [];
    return const Scaffold(
        body: Column(
          children: [
            CalendarTableSection(),
            Divider(),
            // small card that show a summary of the day
            DailySummarySection(),
            Expanded(
              child: CalendarEventsSection()
            ),
          ],
        ));
  }





}

