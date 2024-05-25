import 'package:device_calendar/device_calendar.dart';

extension CalendarExtension on Event {
  static final Expando<Calendar> _calendar = Expando<Calendar>();

  Calendar? get calendar => _calendar[this];
  set calendar(Calendar? calendar) => _calendar[this] = calendar;
}
