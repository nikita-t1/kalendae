import 'dart:collection';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/selected_calendar_provider.dart';

class CalendarSelectionPage extends ConsumerWidget {
  const CalendarSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeviceCalendarPlugin deviceCalendar = DeviceCalendarPlugin.private();

    var calendars = ref.watch(selectedCalendarProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendars'),
      ),
      body: FutureBuilder<Result<UnmodifiableListView<Calendar>>>(
        future: deviceCalendar.retrieveCalendars(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isSuccess) {
            return ListView.builder(
              itemCount: snapshot.data?.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                        "[${snapshot.data!.data![index].id}] ${snapshot.data!.data![index].name ?? ''}"),
                    subtitle:
                        Text(snapshot.data!.data![index].accountName ?? ''),
                    trailing: Checkbox(
                      value: calendars.selectedCalendars.contains(
                          int.parse(snapshot.data!.data![index].id ?? '0')),
                      onChanged: (value) {
                        calendars.toggleCalendar(
                            int.parse(snapshot.data!.data![index].id ?? '0'));
                      },
                    ));
              },
            );
          } else {
            return Container(
                child: Column(
              children: [
                Text('Error: ${snapshot.error}'),
                const Center(child: CircularProgressIndicator()),
                Text('Error loading calendars'),
                Text('Please check your permissions'),
              ],
            ));
          }
        },
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Settings'),
    //   ),
    //   body: ListView(
    //     children: [
    //       ListTile(
    //         title: Text('Checkbox'),
    //         trailing: Checkbox(
    //           value: false,
    //           onChanged: (value) {
    //             // TODO: Implement checkbox logic
    //           },
    //         ),
    //       ),
    //       ListTile(
    //         title: Text('Toggle'),
    //         trailing: Switch(
    //           value: false,
    //           onChanged: (value) {
    //             // TODO: Implement toggle logic
    //           },
    //         ),
    //       ),
    //       ListTile(
    //         title: Text('Menu'),
    //         trailing: Icon(Icons.arrow_forward),
    //         onTap: () {
    //           // TODO: Navigate to menu settings page
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
