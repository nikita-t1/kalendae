import 'dart:math';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/selected_calendar_provider.dart';
import 'package:kalendae/providers/calendar_widget_state_provider.dart';
import 'package:kalendae/service/EventService.dart';

final calendarEventsProvider = FutureProvider.autoDispose<List<Event>>((ref) async {
  var visibleMonthState = ref.watch(calendarWidgetVisibleMonthStateProvider);

  DateTime monthStart = DateTime(visibleMonthState.visibleMonth.year, visibleMonthState.visibleMonth.month, 1);
  DateTime monthEnd = DateTime(visibleMonthState.visibleMonth.year, visibleMonthState.visibleMonth.month + 1, 0);

  final selectedCalendars = ref.watch(selectedCalendarProvider).selectedCalendars;

  EventService eventService = EventService();

  return eventService.fetchEvents(monthStart, monthEnd, selectedCalendars);
});

