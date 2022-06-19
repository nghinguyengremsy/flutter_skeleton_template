import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/my_app.dart';
import 'services/local_storage_services/sembast_database.dart';
import 'theme/theme_controller.dart';
import 'theme/theme_providers.dart';
import 'theme/theme_sembast.dart';
import 'theme/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Init local storage database
  final sembastLocalStore =
      await SembastDataStore.initWithDefaultDatabasename();
  final ThemeService themeService = ThemeServiceSembast(sembastLocalStore);

  final themeModeController = ThemeModeController(themeService);
  await themeModeController.getThemeMode();

  final themeController = SchemeController(themeService);
  await themeController.getTheme();
  runApp(
    ProviderScope(
      overrides: [
        themeModeControllerProvider.overrideWithValue(themeModeController),
        schemeControllerProvider.overrideWithValue(themeController),
      ],
      child: const MyApp(),
    ),
  );
}
