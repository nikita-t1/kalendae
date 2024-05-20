import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/providers/calendar_events_provider.dart';

// The ConsumerWidget
class CalendarEventsSection extends ConsumerWidget {
  const CalendarEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarEventsAsyncValue = ref.watch(calendarEventsProvider);
    return Scaffold(
      body: calendarEventsAsyncValue.when(
        data: (calendarEvents) {
          return calendarEvents.isNotEmpty
              ? ListView.builder(
            itemCount: calendarEvents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  //get color from calendar (calendarEvents[index].calendar.color)
                  color: Color(calendarEvents[index].calendar?.color ?? 255),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      calendarEvents[index].title ?? 'No title',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      calendarEvents[index].start?.toIso8601String() ?? 'No start',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
              : const Center(child: Text('No events found'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          print('Error loading events: $error');
          return Center(
            child: Column(
              children: [
                Text('Error loading events'),
                Text('Please check your permissions'),
              ],
            ),
          );
        }
      ),
    );
  }
}

