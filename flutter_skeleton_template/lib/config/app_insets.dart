/*
 * File:       app_insets.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
/// AppInsets represents the sizes used in this app, usually multiple of 2 in a
/// gradually increasing way, like 2, 4, 8, 16, 32, 64, ...
class AppInsets {
  // This class is not meant to be instantiated or extended. This constructor
  // prevents external instantiation and extension, plus it does not show up
  // in IDE code completion. We like static classes for constants because it
  // name spaces them and gives them a self documenting group and context that
  // they belong to.
  AppInsets._();

  ///XS size inset, 2
  static const double xs = 2;

  ///S size inset, 4
  static const double s = 4;

  ///M size inset, 8
  static const double m = 8;

  ///L size inset, 16
  static const double l = 16;

  ///XL size inset, 32
  static const double xl = 32;

  ///XXL size inset, 64
  static const double xxl = 64;

  /// This app uses more than normal rounding on button sides, an shape corners,
  ///default: 14
  /// for example on corners of bottom sheets.
  static const double cornerRadius = 14;

  /// Outline thickness on outline and toggle buttons.
  ///default: 1.5
  static const double outlineThickness = 1.5;

  /// Bottom sheet elevation
  /// default: 6
  static const double bottomSheetElevation = 6;

  /// The max dp width used for layout content on the screen in the available
  /// body area.
  /// Wider content gets growing side padding, kind of like on most
  /// web pages when they are used on super wide screen. Just a design used for
  /// this app, that works pretty well in used examples on web & desktop.
  /// default: 1000
  static const double maxBodyWidth = 1000;

  /// Edge padding for page content on the screen. A better looking result
  /// can be obtained if this increases in steps depending on canvas size.
  /// Keeping it fairly tight now, but not too small, it is a compromise for
  /// both phone and larger media.
  /// default: 12
  static const double edge = 12;
}
