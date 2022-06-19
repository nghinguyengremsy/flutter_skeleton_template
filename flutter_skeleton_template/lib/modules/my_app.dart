import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../config/config.dart';
import '../theme/theme_files.dart';

class MyApp extends ConsumerStatefulWidget {
  ///Construct
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    // const usedScheme = FlexScheme.blumineBlue;
    final _themeMode = ref.watch(themeModeControllerProvider);
    final _schemeIndex = ref.watch(schemeControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, child!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(AppConst.mobileBreakpoint, name: MOBILE),
          ResponsiveBreakpoint.resize(AppConst.tabletBreakpoint, name: TABLET),
          ResponsiveBreakpoint.resize(
            AppConst.desktopBreakpoint,
            name: DESKTOP,
          ),
          ResponsiveBreakpoint.autoScale(AppConst.ultraBreakpoint, name: 'XL'),
        ],
      ),
      title: 'Gremsy HUB',
      theme: AppTheme.light(
        usedTheme: _schemeIndex,
        swapColors: false,
        appBarStyle: FlexAppBarStyle.primary,
        appBarElevation: 0.5,
        surfaceStyle: FlexSurface.medium,
      ),

      darkTheme: AppTheme.dark(
        usedTheme: _schemeIndex,
        swapColors: false,
        appBarStyle: FlexAppBarStyle.primary,
        appBarElevation: 0.5,
        surfaceStyle: FlexSurface.medium,
        darkIsTrueBlack: false,
        computeDark: false,
        darkLevel: 35,
      ),
      themeMode: _themeMode,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations
            .delegate, // This is required for adativie_dialog
      ],
      //Must add supportedLocales to use locale in table calendar
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      // home: const LandingPage(), // NOTE: use GoRoute to navigate to the page.
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        name: 'landing',
        path: '/',
        builder: (context, state) => LandingPage(
          key: state.pageKey,
        ),
      ),

      GoRoute(
        name: productionHubRouteName,
        path: '/Production-Hub',
        builder: (context, state) => ProductionHubPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: ftqcManagementRouteName,
        path: '/FtQc-Management',
        builder: (context, state) => FtQcMonitorPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: productionPlanningRouteName,
        path: '/Production-Planning',
        builder: (context, state) {
          return ProductionPlanningPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        name: inventoryManagementRouteName,
        path: '/Inventory-Management',
        builder: (context, state) => InventoryManagementPage(
          key: state.pageKey,
        ),
      ),
      //TODO: Them cac route cho cac module khác

      GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (context, state) => SettingsPage(
          key: state.pageKey,
        ),
      ),
    ],
    // initialLocation: '/',
    errorBuilder: (context, state) =>
        ErrorPage(errorState: state.error.toString()),
  );
}

///Error page when GoRouter got error
class ErrorPage extends StatelessWidget {
  ///
  const ErrorPage({
    Key? key,
    required this.errorState,
  }) : super(key: key);

  ///Error to show
  final String errorState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Text('Error: $errorState'),
        ),
      ),
    );
  }
}
