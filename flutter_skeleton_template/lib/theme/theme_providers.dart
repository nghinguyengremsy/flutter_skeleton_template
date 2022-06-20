import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_controller.dart';

///Theme mode controller
final themeModeControllerProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  return throw UnimplementedError('Waiting for theme service');
});

///Theme controller provider, return an index of scheme, this index must be used to get the scheme in [AppTheme.schemes] list
final schemeControllerProvider =
    StateNotifierProvider<SchemeController, int>((ref) {
  return throw UnimplementedError('Waiting for theme service');
});
