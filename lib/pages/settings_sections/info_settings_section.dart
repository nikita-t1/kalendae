import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalendae/widgets/settings_category.dart';
import 'package:kalendae/widgets/settings_tile.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../providers/settings_provider.dart';

class InfoSettingsSection extends ConsumerWidget {
  const InfoSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return SettingsCategory(header: "ABOUT", children: [
      SettingsTile(
        title: const Text('Version'),
        subtitle: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.version);
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    ]);
  }
}
