import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Widget title;
  final Widget? description;
  final Widget? icon;
  final Widget? subtitle;
  final Widget? trailing;
  final bool enabled;
  final bool visible;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.subtitle,
    this.trailing,
    this.enabled = true,
    this.visible = true,
    this.onTap,
  });

  SettingsTile.withSwitch({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.subtitle,
    required bool value,
    ValueChanged<bool>? onChanged,
    Color? activeColor,
    this.enabled = true,
    this.visible = true,
  })  : trailing = Switch.adaptive(
    value: value,
    onChanged: enabled ? onChanged : null,
    activeColor: activeColor,
  ),
        onTap = (() => onChanged?.call(!value));

  @override
  Widget build(BuildContext context) {
    Widget? _subtitle = subtitle;

    // if (subtitle != null) {
    //   _subtitle = DefaultTextStyle(
    //     style: context.theme.textTheme.subtitle2!.copyWith(
    //       color: context.theme.textTheme.caption!.color,
    //     ),
    //     child: subtitle!,
    //   );
    // }

    return Visibility(
      visible: visible,
      child: MediaQuery.removeViewPadding(
        context: context,
        removeLeft: true,
        removeRight: true,
        child: ListTile(
          contentPadding: const EdgeInsetsDirectional.fromSTEB(
            16.0,
            0.0,
            16.0,
            0.0,
          ),
          leading: icon != null
              ? IconTheme.merge(
            // data: context.theme.iconTheme,
            data: IconTheme.of(context),
            child: icon!,
          )
              : null,
          title: title,
          trailing: trailing ?? description,
          subtitle: _subtitle,
          enabled: enabled,
          onTap: onTap,
        ),
      ),
    );
  }
}
