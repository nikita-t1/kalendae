import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/visible_calendar_month_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calMonth = ref.watch(visibleCalendarMonthProvider);

    return Scaffold(
      body: TableCalendar(
        headerVisible: false,
        startingDayOfWeek: StartingDayOfWeek.monday,
        sixWeekMonthsEnforced: true,
        onPageChanged: (focusedDay) => calMonth.selectMonth(focusedDay),
        firstDay: DateTime.utc(1970),
        lastDay: DateTime.utc(2038, 1, 18),
        focusedDay: calMonth.visibleMonth,
        // onDaySelected: (selectedDay, focusedDay) => calMonth.selectMonth(selectedDay),
        weekNumbersVisible: true,
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
