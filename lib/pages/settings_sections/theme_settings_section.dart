import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/widgets/settings_category.dart';
import 'package:kalendae/widgets/settings_tile.dart';

import '../../providers/settings_provider.dart';

class ThemeSettingsSection extends ConsumerWidget {
  const ThemeSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return SettingsCategory(header: "THEME", children: [
      SettingsTile.withSwitch(
          enabled: false,
          icon: const Icon(Icons.brightness_auto_outlined),
          title: const Text('Use system theme'),
          // subtitle: const Text(
          value: false,
      ),
      const Divider(
        indent: 20,
        endIndent: 20,
      ),
      SettingsTile.withSwitch(
          icon: const Icon(Icons.brightness_medium_outlined),
          title: const Text('Dark Mode'),
          subtitle: const Text('Enable dark mode'),
          value: settings.darkMode,
          onChanged: (value) {
            settings.toggleDarkMode();
          }),
    ]);
  }
}
