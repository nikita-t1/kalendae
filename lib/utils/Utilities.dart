import 'package:intl/intl.dart';

class Utilities {
  static String formatDate(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String dayOfWeekFromInt(int day) {
    // Make sure day is from 1(Monday) to 7(Sunday)
    assert(day >= 1 && day <= 7);

    final now = DateTime.now();
    final desiredDay = now.subtract(Duration(days: now.weekday - day));
    final formatter = DateFormat.EEEE();

    return formatter.format(desiredDay);
  }
}
