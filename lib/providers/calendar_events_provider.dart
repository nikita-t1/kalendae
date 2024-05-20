import 'package:device_calendar/device_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/selected_calendar_provider.dart';

final calendarEventsProvider = FutureProvider.autoDispose<List<Event>>((ref) async {
  final selectedCalendars = ref.watch(selectedCalendarProvider).selectedCalendars;
  DeviceCalendarPlugin deviceCalendarPlugin = DeviceCalendarPlugin();
  var calendars = await deviceCalendarPlugin.retrieveCalendars();
  final startDate = DateTime.now().add(const Duration(days: -30));
  final endDate = DateTime.now().add(const Duration(days: 365 * 10));
  List<Event> events = [];
  for (var calendarId in selectedCalendars) {
    calendars.data?.forEach((element) {
    });
    var calendar = calendars.data?.where((element) => element.id == calendarId.toString()).first;
    var calendarEventsResult = await deviceCalendarPlugin.retrieveEvents(
        calendarId.toString(),
        RetrieveEventsParams(startDate: startDate, endDate: endDate));
    calendarEventsResult.data?.forEach((event) {
      event.calendar = calendar!;
    });
    events.addAll(calendarEventsResult.data ?? []);
  }

  events.sort((a, b) => a.start!.compareTo(b.start!));
  return events;
});


extension CalendarExtension on Event {
static final Expando<Calendar> _calendar = Expando<Calendar>();

Calendar? get calendar => _calendar[this];
set calendar(Calendar? calendar) => _calendar[this] = calendar;
}
