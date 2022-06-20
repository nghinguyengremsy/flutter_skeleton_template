import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

import '../services/local_storage_services/sembast_database.dart';
import 'theme_service.dart';

///Theme service using Sembast local storage databse
class ThemeServiceSembast implements ThemeService {
  ///
  ThemeServiceSembast(this.dataStore);

  ///Local database
  final SembastDataStore dataStore;

  ///Setting store to store all user settings for the app
  final settingsStore = StoreRef(SembastDataStore.settingStore);
  @override
  Future<void> init() async {
    //Do nothing
  }

  ///Load theme mode from local storage
  @override
  Future<ThemeMode> themeMode() async {
    try {
      final int? _themeModeValue = await settingsStore
          .record(ThemeService.keyThemeMode)
          .get(dataStore.db);
      if (_themeModeValue == null) return ThemeService.defaultThemeMode;
      return ThemeMode.values[_themeModeValue];
    } catch (e) {
      debugPrint(
          'Get theme mode error: ${e.toString()}, return the default theme mode');
      return ThemeService.defaultThemeMode;
    }
  }

  @override
  Future<void> saveThemeMode(ThemeMode value) async {
    try {
      await settingsStore
          .record(ThemeService.keyThemeMode)
          .put(dataStore.db, value.index);
    } catch (e) {
      debugPrint('Save theme mode error: ${e.toString()}');
    }
  }

  ///Load theme from local storage
  @override
  Future<FlexScheme> usedScheme() async {
    try {
      final int? value = await settingsStore
          .record(ThemeService.keyUsedScheme)
          .get(dataStore.db);

      if (value != null) {
        return FlexScheme.values[value];
      } else {
        return FlexScheme.values[ThemeService.defaultUsedScheme.index];
      }
    } catch (e) {
      debugPrint('Get used scheme error: ${e.toString()}');
      return ThemeService.defaultUsedScheme;
    }
  }

  ///Save theme to local storage
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {
    try {
      await settingsStore
          .record(ThemeService.keyUsedScheme)
          .put(dataStore.db, value.index);
    } catch (e) {
      debugPrint('Save scheme error: ${e.toString()}');
    }
  }

  @override
  Future<int> schemeIndex() async {
    try {
      final int value = await settingsStore
              .record(ThemeService.keySchemeIndex)
              .get(dataStore.db) ??
          ThemeService.defaultSchemeIndex;

      return value;
    } catch (e) {
      debugPrint('Get scheme index error: ${e.toString()}');
      return ThemeService.defaultSchemeIndex;
    }
  }

  @override
  Future<void> saveSchemeIndex(int value) async {
    try {
      await settingsStore
          .record(ThemeService.keySchemeIndex)
          .put(dataStore.db, value);
    } catch (e) {
      debugPrint('Save scheme index error: ${e.toString()}');
    }
  }
}
