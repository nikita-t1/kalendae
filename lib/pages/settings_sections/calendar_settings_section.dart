import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/calendar_settings_provider.dart';
import 'package:kalendae/utils/Utilities.dart';
import 'package:kalendae/widgets/settings_category.dart';
import 'package:kalendae/widgets/settings_tile.dart';

class CalendarSettingsSection extends ConsumerWidget {
  const CalendarSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarSettings = ref.watch(calendarSettingsProvider);

    return SettingsCategory(header: "CALENDAR", children: [
      SettingsTile.withSwitch(
        title: const Text('Show Calendar Weeks'),
        value: calendarSettings.showCalendarWeeks,
        onChanged: (value) {
          calendarSettings.toggleShowCalendarWeeks();
        },
      ),
      SettingsTile(
        title: const Text('First Day of the Week'),
        subtitle:
            Text(Utilities.dayOfWeekFromInt(calendarSettings.firstDayOfWeek)),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                        title: Text(
                            Utilities.dayOfWeekFromInt(DateTime.saturday),
                            style: calendarSettings.firstDayOfWeek ==
                                    DateTime.saturday
                                ? TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : null),
                        trailing: calendarSettings.firstDayOfWeek ==
                                DateTime.saturday
                            ? Icon(Icons.check,
                                color: Theme.of(context).colorScheme.primary)
                            : null,
                        onTap: () {
                          calendarSettings.setFirstDayOfWeek(DateTime.saturday);
                          Navigator.pop(context);
                        }),
                    ListTile(
                        title: Text(Utilities.dayOfWeekFromInt(DateTime.sunday),
                            style: calendarSettings.firstDayOfWeek ==
                                    DateTime.saturday
                                ? TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : null),
                        trailing: calendarSettings.firstDayOfWeek ==
                                DateTime.sunday
                            ? Icon(Icons.check,
                                color: Theme.of(context).colorScheme.primary)
                            : null,
                        onTap: () {
                          calendarSettings.setFirstDayOfWeek(DateTime.sunday);
                          Navigator.pop(context);
                        }),
                    ListTile(
                      title: Text(
                        Utilities.dayOfWeekFromInt(DateTime.monday),
                        style: calendarSettings.firstDayOfWeek ==
                                DateTime.monday
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            : null,
                      ),
                      trailing:
                          calendarSettings.firstDayOfWeek == DateTime.monday
                              ? Icon(Icons.check,
                                  color: Theme.of(context).colorScheme.primary)
                              : null,
                      onTap: () {
                        calendarSettings.setFirstDayOfWeek(DateTime.monday);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    ]);
  }
}
