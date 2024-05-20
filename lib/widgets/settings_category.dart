import 'package:flutter/material.dart';

class SettingsCategory extends StatelessWidget {
  final String header;
  final List<Widget> children;

  const SettingsCategory({
    super.key,
    required this.header,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(
            16,
            8, //16
            16,
            8,
          ),
          child: headerWidget(header),
        ),
        ...children,
      ],
    );
  }

  Widget headerWidget(String text) => Builder(
    builder: (context) => Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        letterSpacing: 2,
      ),
    ),
  );
}
