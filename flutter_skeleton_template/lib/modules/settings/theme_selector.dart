import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../../theme/theme_files.dart';

/// This is a theme selector using a ListTile with a Popup-up menu theme
/// selection widget.
class ThemeSelector extends ConsumerWidget {
  ///Construct
  const ThemeSelector({
    Key? key,
    this.contentPadding,
  }) : super(key: key);

  /// The ListTiles tile's internal padding.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Size of the theme selector with theme colors.
    const _height = 23.0;
    const _width = _height * 1.3;

    final isLight = Theme.of(context).brightness == Brightness.light;
    final scheme = Theme.of(context).colorScheme;
    final selected = ref.watch(schemeControllerProvider);

    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      onSelected: (int newTheme) {
        ref.read(schemeControllerProvider.notifier).setTheme(newTheme);
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < AppTheme.schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              // contentPadding: EdgeInsets.zero,
              title: Text(AppTheme.schemes[i].name),
              leading: SizedBox(
                width: _width * 2,
                child: FlexThemeModeOptionButton(
                  flexSchemeColor: isLight
                      ? AppTheme.schemes[i].light
                      : AppTheme.schemes[i].dark,
                  selected: true,
                  selectedBorder: BorderSide(
                    color: isLight
                        ? AppTheme.schemes[i].light.primary
                        : AppTheme.schemes[i].dark.primary,
                    width: AppInsets.outlineThickness,
                  ),
                  backgroundColor: scheme.background,
                  width: _width,
                  height: _height * 0.8,
                  padding: EdgeInsets.zero,
                  borderRadius: 0,
                  optionButtonPadding: EdgeInsets.zero,
                  optionButtonMargin: EdgeInsets.zero,
                  optionButtonBorderRadius: AppInsets.cornerRadius,
                ),
              ),
            ),
          )
      ],
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Chủ đề: ${AppTheme.schemes[selected].name}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(width: AppInsets.m),
            FlexThemeModeOptionButton(
              flexSchemeColor: FlexSchemeColor(
                primary: scheme.primary,
                primaryVariant: scheme.primaryContainer,
                secondary: scheme.secondary,
                secondaryVariant: scheme.secondaryContainer,
              ),
              selected: true,
              selectedBorder: BorderSide(
                color: scheme.primary,
                width: AppInsets.outlineThickness,
              ),
              backgroundColor: scheme.background,
              width: _width,
              height: _height,
              padding: EdgeInsets.zero,
              borderRadius: 0,
              optionButtonPadding: EdgeInsets.zero,
              optionButtonMargin: EdgeInsets.zero,
              optionButtonBorderRadius: AppInsets.cornerRadius,
            ),
            const SizedBox(width: AppInsets.m),
          ],
        ),
      ),
    );
  }
}
