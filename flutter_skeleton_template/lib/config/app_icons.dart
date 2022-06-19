/*
 * File:       app_icons.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/material.dart';

/// Icons used in this application.
///
/// Using a class for "feature" based icons used in the application makes
/// it easy to edit them in one place if we want tho change an icons used
/// for feature, and we have central point to maintain our app icons.
class AppIcons {
  // This class is not meant to be instantiated or extended. This constructor
  // prevents external instantiation and extension, plus it does not show up
  // in IDE code completion. We like static classes for constants because it
  // name spaces them and gives them a self documenting group and context that
  // they belong to.
  AppIcons._();
  // The main icons we use
  ///Menu icon
  static const IconData menuItemOpen = Icons.arrow_forward_ios;

  ///Add icon
  static const IconData add = Icons.add;

  ///Info icon
  static const IconData info = Icons.info;

  // Theme mode switch icons
  ///Light mode icon
  static const IconData lightTheme = Icons.wb_sunny;

  ///System mode icon, phone
  static const IconData systemThemePhone = Icons.phone_iphone;

  ///System mode icon, desktop
  static const IconData systemThemeDesktop = Icons.desktop_mac_outlined;

  ///Dark mode icon
  static const IconData darkTheme = Icons.bedtime;

  // Surface style icons
  ///custom surface icon
  static const IconData customSurface = Icons.lens;

  ///default surface icon
  static const IconData defaultSurface = Icons.block;

  // AppBar style icons
  ///Appbar colored icon
  static const IconData appbarColored = Icons.panorama_wide_angle_select;

  ///Appbar surface icon
  static const IconData appbarSurface = Icons.panorama_wide_angle_outlined;
}
