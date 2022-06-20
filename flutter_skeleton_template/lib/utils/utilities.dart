/*
 * File:       utilities.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

///Utilities function
class Utils {
  Utils._();

  ///Convert current date to String
  ///if [useTime] is true, it will use format 'd/M/y * HH:mm:ss' to convert with time trailing
  ///else, convert date only
  ///[epochTimestampInSeconds] is a parameter to input,
  ///with value in Epoch seconds format
  static String convertEpochToDate({
    required int epochTimestampInSeconds,
    required bool useTime,
  }) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(epochTimestampInSeconds * 1000);
    if (useTime) {
      // Format time will be, e.g: 7/6/2021-01:15:07, ngay 7 thang 6 nam 2021, luc 1 gio 15 phut 07 giay
      final formatDate = DateFormat('d/M/y * HH:mm:ss');
      final mDate = formatDate.format(date);
      return mDate;
    }
    final formatDate = DateFormat('d/M/y');
    final mDate = formatDate.format(date);
    return mDate;
  }

  /// Return a String represent the time in Epoch format with unit in seconds from current time and date
  static String getTimestampInEpochFromCurrent() {
    return ((DateTime.now().millisecondsSinceEpoch) / 1000).toStringAsFixed(0);
  }

  /// Convert date time to epoch time
  static String getTimestampInEpochFromDatTime(DateTime dateTime) {
    return (dateTime.millisecondsSinceEpoch / 1000).toStringAsFixed(0);
  }

  ///This function to show information in debug mode
  static void log({required String title, required dynamic info}) {
    if (kDebugMode) {
      debugPrint('$title: ${info.toString()}');
    }
  }
}
