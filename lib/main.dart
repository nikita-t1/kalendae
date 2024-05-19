import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalendae/pages/home_page.dart';
import 'package:kalendae/providers/visible_calendar_month_provider.dart';

void main() {
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
    return MaterialApp(
      title: 'Kalendae',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
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

    var calMonth = ref.watch(visibleCalendarMonthProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('MMMM yyyy').format(calMonth.visibleMonth)),
      ),
      body: const HomePage(),
    );
  }
}
