// ignore_for_file: public_member_api_docs

/*
 * File:       app_colors.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/material.dart';

///Colors used in this app, basically for display in production
///

class AppColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColors._();
  static const white = Colors.white;
  static const black = Colors.black;
  static const ruby = Color(0xFFE02020);
  static const rubyHSLColors = [
    HSLColor.fromAHSL(1, 360, 0.76, 0.25),
    HSLColor.fromAHSL(1, 360, 0.76, 0.37),
    HSLColor.fromAHSL(1, 360, 0.76, 0.5),
    HSLColor.fromAHSL(1, 360, 0.76, 0.63),
    HSLColor.fromAHSL(1, 360, 0.76, 0.75),
  ];

  static const amber = Color(0xFFFF6600);
  static const amberHSLColors = [
    HSLColor.fromAHSL(1, 24, 1.0, 0.25),
    HSLColor.fromAHSL(1, 24, 1.0, 0.37),
    HSLColor.fromAHSL(1, 24, 1.0, 0.5),
    HSLColor.fromAHSL(1, 24, 1.0, 0.63),
    HSLColor.fromAHSL(1, 24, 1.0, 0.75),
  ];
  static const citrine = Color(0xFFFFBB00);
  static const citrineHSLColors = [
    HSLColor.fromAHSL(1, 44, 1.0, 0.25),
    HSLColor.fromAHSL(1, 44, 1.0, 0.37),
    HSLColor.fromAHSL(1, 44, 1.0, 0.5),
    HSLColor.fromAHSL(1, 44, 1.0, 0.63),
    HSLColor.fromAHSL(1, 44, 1.0, 0.75),
  ];

  static const emerald = Color(0xFF6DD400);
  static const emeraldHSLColors = [
    HSLColor.fromAHSL(1, 89, 1.0, 0.25),
    HSLColor.fromAHSL(1, 89, 1.0, 0.37),
    HSLColor.fromAHSL(1, 89, 1.0, 0.42),
    HSLColor.fromAHSL(1, 89, 1.0, 0.63),
    HSLColor.fromAHSL(1, 89, 1.0, 0.75),
  ];

  static const amazonite = Color(0xFF2DD2AD);
  static const amazoniteHSLColors = [
    HSLColor.fromAHSL(1, 167, 0.65, 0.25),
    HSLColor.fromAHSL(1, 167, 0.65, 0.37),
    HSLColor.fromAHSL(1, 167, 0.65, 0.5),
    HSLColor.fromAHSL(1, 167, 0.65, 0.63),
    HSLColor.fromAHSL(1, 167, 0.65, 0.75),
  ];

  static const apatite = Color(0xFF32C5FF);
  static const apatiteHSLColors = [
    HSLColor.fromAHSL(1, 197, 1.0, 0.25),
    HSLColor.fromAHSL(1, 197, 1.0, 0.37),
    HSLColor.fromAHSL(1, 197, 1.0, 0.60),
    HSLColor.fromAHSL(1, 197, 1.0, 0.63),
    HSLColor.fromAHSL(1, 197, 1.0, 0.75),
  ];

  static const sapphire = Color(0xFF0091FF);
  static const sapphireHSLColors = [
    HSLColor.fromAHSL(1, 206, 1.0, 0.25),
    HSLColor.fromAHSL(1, 206, 1.0, 0.37),
    HSLColor.fromAHSL(1, 206, 1.0, 0.5),
    HSLColor.fromAHSL(1, 206, 1.0, 0.63),
    HSLColor.fromAHSL(1, 206, 1.0, 0.75),
  ];

  static const lotite = Color(0xFF6236FF);
  static const lotiteHSLColors = [
    HSLColor.fromAHSL(1, 253, 1.0, 0.25),
    HSLColor.fromAHSL(1, 253, 1.0, 0.37),
    HSLColor.fromAHSL(1, 253, 1.0, 0.61),
    HSLColor.fromAHSL(1, 253, 1.0, 0.63),
    HSLColor.fromAHSL(1, 253, 1.0, 0.75),
  ];
  static const amethyst = Color(0xFFB620E0);
  static const amethystHSLColors = [
    HSLColor.fromAHSL(1, 287, 0.76, 0.25),
    HSLColor.fromAHSL(1, 287, 0.76, 0.37),
    HSLColor.fromAHSL(1, 287, 0.76, 0.50),
    HSLColor.fromAHSL(1, 287, 0.76, 0.63),
    HSLColor.fromAHSL(1, 287, 0.76, 0.75),
  ];

  static const graphite = Color(0xFF6d7278);
  static const graphiteHSLColors = [
    HSLColor.fromAHSL(1, 213, 0.05, 0.25),
    HSLColor.fromAHSL(1, 213, 0.05, 0.37),
    HSLColor.fromAHSL(1, 213, 0.05, 0.45),
    HSLColor.fromAHSL(1, 213, 0.05, 0.63),
    HSLColor.fromAHSL(1, 213, 0.05, 0.75),
  ];
  static const primaryColor = Color.fromARGB(255, 139, 180, 226);
  static const secondaryColor = Color.fromARGB(255, 53, 121, 199);
  static const shimmerBaseColor = Color.fromARGB(255, 255, 255, 255);
  static const successfulColor = Color.fromARGB(255, 23, 173, 86);
  static const warnningColor = Color.fromARGB(255, 194, 26, 26);

  // static const shimmerBaseColor = Color.fromARGB(219, 219, 230, 100);

  static const shimmerHighlightColor = Color.fromARGB(255, 233, 235, 238);
}
