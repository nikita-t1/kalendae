import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalendae/pages/calendars_selection_page.dart';
import 'package:kalendae/pages/home_page.dart';
import 'package:kalendae/pages/settings_page.dart';
import 'package:kalendae/providers/calendar_widget_state_provider.dart';
import 'package:kalendae/providers/settings_provider.dart';
import 'package:localstorage/localstorage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(
    const ProviderScope(
      child: KalendaeApp(),
    ),
  );
}

class KalendaeApp extends ConsumerWidget {
  const KalendaeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      title: 'Kalendae',
      debugShowCheckedModeBanner: true,
      // darkTheme: settings.darkMode ? ThemeData.dark() : ThemeData.light(),
      themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            secondary: Colors.amber.shade600,
            error: Colors.redAccent,
            primary: Colors.amber,
            brightness: Brightness.dark),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            secondary: Colors.amber.shade600,
            error: Colors.redAccent,
            primary: Colors.amber),
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: const DefaultLayout(),
    );
  }
}

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleMonthState = ref.watch(calendarWidgetVisibleMonthStateProvider);
    var selectedDayState = ref.watch(calendarWidgetSelectedDayStateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CalendarSelectionPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
            DateFormat('MMMM yyyy').format(visibleMonthState.visibleMonth)),
        actions: [
          IconButton(
            icon: const Icon(Icons.today_outlined),
            tooltip: 'Today',
            onPressed: () {
              selectedDayState.selectDay(DateTime.now());
              visibleMonthState.setVisibleMonth(DateTime.now());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Kalendae'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Calendars'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalendarSelectionPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: HomePage(),
    );
  }
}
