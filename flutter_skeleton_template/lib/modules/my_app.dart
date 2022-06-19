/*
 * File:       my_app.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../config/config.dart';

import '../theme/theme_files.dart';
import 'home_page/home_page.dart';
import 'settings/settings_page.dart';

///
class MyApp extends ConsumerStatefulWidget {
  ///Construct
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // ThemeMode themeMode = ThemeMode.system;
  @override
  void initState() {
    super.initState();
  }

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
      title: AppConst.appName,
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
      routeInformationProvider: _router.routeInformationProvider,

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
        routes: [
          GoRoute(
            name: AppRouter.HOMESCREEN,
            path: AppRouter.HOMESCREEN,
            builder: (context, state) => HomePage(
              key: state.pageKey,
            ),
            routes: [],
          ),
          GoRoute(
            name: AppRouter.SETTINGS,
            path: AppRouter.SETTINGS,
            builder: (context, state) => SettingsPage(
              key: state.pageKey,
            ),
          ),
        ],
      ),
    ],
    // initialLocation: '/',
    errorBuilder: (context, state) =>
        ErrorPage(errorState: state.error.toString()),
  );
}

///Landing Screen is the first screen show when app launch
class LandingPage extends ConsumerStatefulWidget {
  ///Construct
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // final _userAsync = ref.watch(currentUserStreamProvider);

    // // 3. watch selectedPageBuilderProvider

    // return AsyncValueWidget<UserModel?>(
    //   value: _userAsync,
    //   data: (mUser) {
    //     if (mUser != null) {
    //       // return const MainScreen();
    //       // debugPrint('User changed: $mUser');
    //       return HomePage();
    //     } else {
    //       return const AuthPage();
    //     }
    //   },
    // );
    return HomePage();
  }
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
