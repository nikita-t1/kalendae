import 'package:device_calendar/device_calendar.dart';
import 'package:kalendae/extensions/CalendarExtension.dart';

class EventService {
  final DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();

  Future<List<Event>> fetchEvents(DateTime monthStart, DateTime monthEnd, List<int> selectedCalendars) async {
    List<Event> events = [];
    var calendars = await _deviceCalendarPlugin.retrieveCalendars();

    for (var calendarId in selectedCalendars) {
      var calendar = calendars.data
          ?.where((element) => element.id == calendarId.toString())
          .first;

      var calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
          calendarId.toString(),
          RetrieveEventsParams(startDate: monthStart, endDate: monthEnd)
      );

      calendarEventsResult.data?.forEach((event) {
        event.calendar = calendar!;
      });

      events.addAll(calendarEventsResult.data ?? []);
    }

    events.sort((a, b) => a.start!.compareTo(b.start!));
    return events;
  }
}
