// ignore_for_file: public_member_api_docs
/*
 * File:       app_const.dart
 * Created on: Sun Jun 19 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */

/// Layout constants and strings used in the example application
class AppConst {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppConst._();

  ///App name
  static const String appName = 'Flutter App';

  ///App Version,  update this info before building app.
  static const String version = '0.1.0';

  /// The max dp width used for layout content on the screen in the available
  /// body area. Wider content gets growing side padding, kind of like on most
  /// web pages when they are used on super wide screen. Just a design used for
  /// this demo app, that works pretty well in this use case.
  /// default value: 1000
  static const double maxBodyWidth = 1000;

  // Extra small devices (phones, 600px and down)
  static const mobileBreakpoint = 600.0;

  ///Medium devices (landscape tablets, 768px and up)
  static const tabletBreakpoint = 768.0;

  ///Large devices (laptops/desktops, 992px and up)
  static const desktopBreakpoint = 992.0;

  ///Extra large devices (large laptops and desktops, 1200px and up)
  static const ultraBreakpoint = 1200.0;

  /// The default width of the side menu when expanded to full menu.
  static const double menuWidth = 275;

  /// The default width of the side menu when collapsed to a rail.
  /// rail width for mobile
  static const double railWidthMobile = 52;

  ///rail width for desktop
  static const double railWidthDesktop = 66;

  ///minimum width of the page view
  ///if reach this minimum width, show hide the side menu or doing something base on this
  static const double minPageWidth = tabletBreakpoint * 0.9;

  /// The minimum media size needed for desktop/large tablet menu view.
  /// Only at higher than this breakpoint will the menu open and be possible
  /// to toggle between menu and rail. Below this breakpoint it toggles between
  /// hidden in the Drawer and rail, also on phones. This is just the default
  /// value for the constructor and it can be set differently in
  /// ResponsiveScaffold constructor.
  static const double breakpointShowFullMenu = 900;

  ///Background inamge for page header
  static const pageAppbarBgImg = 'assets/images/page_appbar_bg.jpg';

  ///Default avatar image, use as a place holder if there is no
  ///user profile image
  static const defaultAvatarImage = 'assets/brand/Sub Logo V1.png';
}

/// Fonts assets used in this application,
class AppFonts {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppFonts._();

  /// We use usage specific terms like mainFont and logoFont in the code,
  /// not actual font names. These names then refer to const strings containing
  /// the actual used font name.
  static const String mainFont = fontRoboto;

  /// We use Roboto as an asset so we can get it on all platforms and have same
  /// look. If we do not do this, then on some platforms we will instead get a
  /// Roboto 'like' font as replacement font. In this app we want to make sure
  /// we actually use Roboto on all platforms. So we provide it as a bundled
  /// asset and also specify it in our theme explicitly via the mainFont.
  static const String fontRoboto = 'Roboto';
}
