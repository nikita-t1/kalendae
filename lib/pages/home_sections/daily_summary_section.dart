import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalendae/providers/calendar_events_provider.dart';
import 'package:kalendae/providers/calendar_widget_state_provider.dart';
import 'package:table_calendar/table_calendar.dart';

// The ConsumerWidget
class DailySummarySection extends ConsumerWidget {
  const DailySummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDayState = ref.watch(calendarWidgetSelectedDayStateProvider);
    final calendarEventsAsyncValue = ref.watch(calendarEventsProvider);

    var monthEvents = calendarEventsAsyncValue.valueOrNull ?? [];

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ListTile(
          title: Text(_formatDateTime(selectedDayState.selectedDay),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(_howBusyIsTheDay(monthEvents
              .where((event) =>
                  isSameDay(event.start!, selectedDayState.selectedDay))
              .toList()))),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE dd MMMM').format(dateTime);
  }

  String _howBusyIsTheDay(List<Event> events) {
    switch (events.length) {
      case 0:
        return 'You have a free day';
      case 1:
        return 'You have an event';
      case 2:
        return 'You have a few events';
      case 3:
      case 4:
        return 'You have a busy day';
      default:
        return 'You have a very busy day';
    }
  }
}
