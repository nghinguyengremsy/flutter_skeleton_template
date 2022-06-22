// ignore_for_file: unused_field
/*
 * File:       app_theme.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_const.dart';
import 'app_insets.dart';
import 'config.dart';

/// The theme for this app are defined here.
class AppTheme {
  // This constructor prevents external instantiation and extension.
  AppTheme._();

  /// Returns the light theme based on properties passed to it.
  static ThemeData light({
    required int usedTheme,
    required bool swapColors,
    required FlexAppBarStyle appBarStyle,
    required double appBarElevation,
    required FlexSurface surfaceStyle,
  }) {
    // We need to use the ColorScheme defined by used FlexColorScheme as input
    // to other theme's, so we create it first.
    final _textTheme = const TextTheme()
        .apply(bodyColor: AppColors.black, displayColor: AppColors.black);
    final _flexScheme = FlexColorScheme.light(
      colors: AppTheme.schemes[usedTheme].light,
      swapColors: swapColors,
      appBarStyle: appBarStyle,
      // surfaceStyle: surfaceStyle,
      appBarElevation: appBarElevation,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: AppFonts.mainFont,
      textTheme: _textTheme,
    );
    // Get the ColorScheme defined by our used FlexColorScheme, we will use
    // the colors in it, in an example to customize the default colors in
    // some Widgets sub-themes.
    final _colorScheme = _flexScheme.toScheme;
    // Convert FlexColorScheme to ThemeData, apply sub-themes and return it.
    return _flexScheme.toTheme.copyWith(
      // Add our custom button shape and padding theming.
      elevatedButtonTheme: elevatedButtonTheme(_colorScheme),
      outlinedButtonTheme: outlinedButtonTheme(
        _colorScheme,
        const Color(0x1F000000),
      ),
      textButtonTheme: AppTheme.textButtonTheme,
      toggleButtonsTheme: toggleButtonsTheme(_colorScheme),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        toolbarTextStyle: TextStyle(
          color: AppColors.white,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.white,
        ),
      ),
    );
  }

  /// Returns the dark theme based on properties passed to it.
  static ThemeData dark({
    required int usedTheme,
    required bool swapColors,
    required FlexAppBarStyle appBarStyle,
    required double appBarElevation,
    required FlexSurface surfaceStyle,
    required bool darkIsTrueBlack,
    required bool computeDark,
    required int darkLevel,
  }) {
    // We need to use the ColorScheme defined by used FlexColorScheme as input
    // to sub-theme's, so we create it first.
    final _textTheme = const TextTheme()
        .apply(bodyColor: AppColors.white, displayColor: AppColors.white);
    final _flexScheme = FlexColorScheme.dark(
      colors: computeDark
          ? schemes[usedTheme].light.defaultError.toDark(darkLevel)
          : schemes[usedTheme].dark,
      swapColors: swapColors,
      appBarStyle: appBarStyle,
      // surfaceStyle: surfaceStyle,
      appBarElevation: appBarElevation,
      darkIsTrueBlack: darkIsTrueBlack,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: AppFonts.mainFont,
      textTheme: _textTheme,
    );
    // Get the ColorScheme defined by our used FlexColorScheme, we will use
    // the colors in it, in an example to customize the default colors in
    // some Widgets sub-themes.
    final _colorScheme = _flexScheme.toScheme;
    // Convert FlexColorScheme to ThemeData, apply sub-themes and return it.
    return _flexScheme.toTheme.copyWith(
      // Add our custom button shape, colors and padding theming.
      elevatedButtonTheme: elevatedButtonTheme(_colorScheme),
      outlinedButtonTheme: outlinedButtonTheme(
        _colorScheme,
        const Color(0x1FFFFFFF),
      ),
      textButtonTheme: textButtonTheme,
      toggleButtonsTheme: toggleButtonsTheme(_colorScheme),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        toolbarTextStyle: TextStyle(
          color: AppColors.white,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.white,
        ),
      ),
    );
  }

  /// These theme definitions are used to give all Material buttons a
  /// a Stadium rounded design. This is just to demonstrate more involved
  /// sub-theming with FlexColorScheme.
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // As an example, say we want the primaryVariant color instead of
          // primary as default on all our ElevatedButtons, then we just use
          // that color instead in this Widget's sub-theme.
          primary: scheme.primaryContainer,
          // For primary color we could just use the onPrimary as the text/icon
          // color on this. However, there is no guarantee that the
          // onPrimary also has correct contrast for primaryVariant, unless you
          // defined your colors like that. There is also no onPrimaryVariant
          // property in the ColorScheme class, a clear feature gap imo. We must
          // thus ourselves ensure we get correct contrasting text/icon color for
          // the primaryVariant color, we can use the SDK ThemeData static
          // function that the ThemeData also uses to evaluate correct contrasting
          // color. For simplicity we just use black and white colors here.
          //
          // Generally if you want some custom colors in your theme that otherwise
          // do no affect built-in Widgets default colors, using primaryVariant
          // and secondaryVariant and putting the colors there for re-use on
          // custom sub-themes for built in Widgets is a good idea.
          // In current SDK the primaryVariant color is only referenced in the
          // SnackBar Widget's default colors, so be aware of that if you change
          // it. If you just need one custom color that you can apply to your
          // built in widgets sub-themes, then using secondaryVariant color
          // is an even better choice, as currently no built in SDK widget uses it
          // for its default colors, so defining the color to something that does
          // not change any default color behaviour.
          onPrimary:
              ThemeData.estimateBrightnessForColor(scheme.primaryContainer) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
          minimumSize: minButtonSize,
          shape: const StadiumBorder(), //buttonShape,
          padding: roundButtonPadding,
          elevation: 0,
        ),
      );

  ///Custom OutlinedButton style
  static OutlinedButtonThemeData outlinedButtonTheme(
    ColorScheme scheme,
    Color disabledColor,
  ) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: AppTheme.minButtonSize,
          shape: const StadiumBorder(),
          padding: AppTheme.roundButtonPadding,
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: disabledColor,
                  width: 0.5,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: scheme.error,
                  width: AppInsets.outlineThickness,
                );
              }
              return BorderSide(
                color: scheme.primary,
                width: AppInsets.outlineThickness,
              );
            },
          ),
        ),
      );

  ///Custom text button theme
  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: AppTheme.minButtonSize,
          shape: const StadiumBorder(),
          padding: AppTheme.roundButtonPadding,
        ),
      );

  /// The stadium rounded buttons generally need a bit more padding to look good,
  /// adjust here to tune the padding for all of them globally in the app.
  static const EdgeInsets roundButtonPadding = EdgeInsets.symmetric(
    horizontal: AppInsets.l,
    vertical: AppInsets.s,
  );

  /// The old buttons had a minimum size that looked OK, we keep that.
  static const Size minButtonSize = Size(88, 36);

  /// ToggleButtons theme
  static ToggleButtonsThemeData toggleButtonsTheme(ColorScheme colorScheme) =>
      ToggleButtonsThemeData(
        selectedColor: colorScheme.onPrimary,
        color: colorScheme.primary.withOpacity(0.85),
        fillColor: colorScheme.primary.withOpacity(0.85),
        hoverColor: colorScheme.primary.withOpacity(0.2),
        focusColor: colorScheme.primary.withOpacity(0.3),
        borderWidth: AppInsets.outlineThickness,
        borderColor: colorScheme.primary,
        selectedBorderColor: colorScheme.primary,
        borderRadius: BorderRadius.circular(AppInsets.cornerRadius),
      );

  // We could also use the FlexSchemeColor.from() constructor and define less
  // color properties and get some of them computed by the from factory.
  // If we do that then custom colors cannot be const, but otherwise it
  // works the same. In this demo we specify all required colors and do not
  // use the convenience features offered by the FlexSchemeColor.from() factory.

  // Custom dark red and green scheme.
  static const FlexSchemeColor _customScheme1Light = FlexSchemeColor(
    primary: Color(0xFF00658F),
    primaryVariant: Color(0xFF44c2e4),
    secondary: Color(0xFF006C50),
    secondaryVariant: Color(0xFF2ea98a),
    appBarColor: Color(0xFF2ea98a),
  );
  static const FlexSchemeColor _customScheme1Dark = FlexSchemeColor(
    primary: Color(0xFF7FCFFF),
    primaryVariant: Color(0xFF006bcc),
    secondary: Color(0xFF66DBB2),
    secondaryVariant: Color(0xFF007f45),
    appBarColor: Color(0xFF007f45),
  );
  // San Juan blue and sea pink.
  static const FlexSchemeColor _customScheme2Light = FlexSchemeColor(
    primary: Color(0xFF395778),
    primaryVariant: Color(0xFF637E9F),
    secondary: Color(0xFFE7949A),
    secondaryVariant: Color(0xFFF2C4C7),
    appBarColor: Color(0xFFF2C4C7),
  );
  static const FlexSchemeColor _customScheme2Dark = FlexSchemeColor(
    primary: Color(0xFF5E7691),
    primaryVariant: Color(0xFF8096B1),
    secondary: Color(0xFFEBA8AD),
    secondaryVariant: Color(0xFFF4CFD1),
    appBarColor: Color(0xFFF4CFD1),
  );
  // Custom dark green and mustard yellow scheme
  static const FlexSchemeColor _customScheme3Light = FlexSchemeColor(
    primary: Color(0xFF2A3639),
    primaryVariant: Color(0xFF98B694),
    secondary: Color(0xFFC1AA44),
    secondaryVariant: Color(0xFFAF942B),
    appBarColor: Color(0xFFAF942B),
  );
  static const FlexSchemeColor _customScheme3Dark = FlexSchemeColor(
    primary: Color(0xFF76887B),
    primaryVariant: Color(0xFFB6CBB3),
    secondary: Color(0xFFD3C37B),
    secondaryVariant: Color(0xFFC6B36A),
    appBarColor: Color(0xFFC6B36A),
  );
  // Oregon orange and green theme
  static const FlexSchemeColor _customScheme4Light = FlexSchemeColor(
    primary: Color(0xFF993200),
    primaryVariant: Color(0xFF6E2400),
    secondary: Color(0xFF1B5C62),
    secondaryVariant: Color(0xFF134045),
    appBarColor: Color(0xFF134045),
  );
  static const FlexSchemeColor _customScheme4Dark = FlexSchemeColor(
    primary: Color(0xFFAE6846),
    primaryVariant: Color(0xFFBE866B),
    secondary: Color(0xFF5FA4AC),
    secondaryVariant: Color(0xFF4C838A),
    appBarColor: Color(0xFF4C838A),
  );
  // Tapestry pink and laser yellow.
  static const FlexSchemeColor _customScheme5Light = FlexSchemeColor(
    primary: Color(0xFFAA637F),
    //
    // As an example, say we like one of the existing built in color definitions
    // for the variant color then just re-use it there:
    primaryVariant: FlexColor.sakuraLightPrimaryVariant,
    secondary: Color(0xFFC2A86B),
    secondaryVariant: Color(0xFFB19249),
    appBarColor: Color(0xFFB19249),
  );
  static const FlexSchemeColor _customScheme5Dark = FlexSchemeColor(
    primary: Color(0xFFBC859B),
    //
    // We use the corresponding pre-defined dark variant color.
    primaryVariant: FlexColor.sakuraDarkPrimaryVariant,
    secondary: Color(0xFFCFBB8B),
    secondaryVariant: Color(0xFFC2A970),
    appBarColor: Color(0xFFC2A970),
  );

  /// Create a list with all our custom color schemes and add
  /// all the FlexColorScheme built-in ones to the end of the list.
  static List<FlexSchemeData> schemes = <FlexSchemeData>[
    //
    // As an example, say you want to add one of the pre-defined FlexColor
    // schemes to the list of schemes we offer as user choices, then just pick
    // the ones you want and insert in the order you want it, here we
    // add the Mandy Red scheme.
    // FlexColor.schemes[FlexScheme.mandyRed]!, // Uncomment to insert pre-defined theme here
    //
    // And continue with your own custom schemes, with own custom names.
    //!<<<Not use these custom theme yet
    // const FlexSchemeData(
    //   name: 'Juan and pink',
    //   description: 'San Juan blue and sea pink.',
    //   light: _customScheme2Light,
    //   dark: _customScheme2Dark,
    // ),
    // const FlexSchemeData(
    //   name: 'Moss and mustard',
    //   description: 'Moss green and mustard yellow.',
    //   light: _customScheme3Light,
    //   dark: _customScheme3Dark,
    // ),
    // const FlexSchemeData(
    //   name: 'Oregon and Eden',
    //   description: 'Oregon orange and eden green.',
    //   light: _customScheme4Light,
    //   dark: _customScheme4Dark,
    // ),
    // const FlexSchemeData(
    //   name: 'Pink and laser',
    //   description: 'Tapestry pink and laser yellow',
    //   light: _customScheme5Light,
    //   dark: _customScheme5Dark,
    // ),
    //!>>>Not use yet
    //
    // As an example:
    // After all our custom color schemes, and hand picked built in colors
    // we add all built in FlexColor schemes.
    // The MandyRed scheme will of course show up as a duplicate when we do
    // this, since we already added it manually already. This is just to
    // demonstrating how to easily add all existing scheme to end of our custom
    // scheme choices.
    ...FlexColor.schemesList,
  ];
}
/*
 * File:       app_theme.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
