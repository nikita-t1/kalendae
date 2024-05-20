import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/pages/settings_sections/calendar_settings_section.dart';
import 'package:kalendae/pages/settings_sections/info_settings_section.dart';
import 'package:kalendae/pages/settings_sections/theme_settings_section.dart';
import 'package:kalendae/providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          ThemeSettingsSection(),
          CalendarSettingsSection(),
          InfoSettingsSection(),
        ],
      ),
    );
  }
}
