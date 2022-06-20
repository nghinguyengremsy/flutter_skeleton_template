// import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

/// Widget using [ToggleButtons) that can be used to toggle the theme mode
/// of an application.
///
/// This is a simple Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ThemeModeSwitch extends StatelessWidget {
  ///
  const ThemeModeSwitch({
    Key? key,
    required this.themeMode,
    required this.onChanged,
  }) : super(key: key);

  ///Theme mode
  final ThemeMode themeMode;

  ///Change the theme mode event
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    IconData _deviceIcon;

    if (kIsWeb) {
      _deviceIcon = AppIcons.systemThemeDesktop;
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      _deviceIcon = AppIcons.systemThemeDesktop;
    } else {
      _deviceIcon = AppIcons.systemThemePhone;
    }

    final isSelected = <bool>[
      themeMode == ThemeMode.light,
      themeMode == ThemeMode.system,
      themeMode == ThemeMode.dark,
    ];
    return ToggleButtons(
      // borderRadius: BorderRadius.all(Radius.circular(24)),
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          onChanged(ThemeMode.light);
        } else if (newIndex == 1) {
          onChanged(ThemeMode.system);
        } else {
          onChanged(ThemeMode.dark);
        }
      },
      children: <Widget>[
        const Icon(AppIcons.lightTheme),
        Icon(_deviceIcon),
        const Icon(AppIcons.darkTheme),
      ],
    );
  }
}
