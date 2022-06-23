/*
 * File:       settings_page.dart
 * Created on: Mon Jun 20 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description 
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../config/config.dart';
import '../../theme/theme_providers.dart';
import 'theme_mode_switch.dart';
import 'theme_selector.dart';

///Setting page, manage general settings: theme, language,...
class SettingsPage extends ConsumerStatefulWidget {
  ///
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _scrollController = ScrollController();
  // late ScrollController scrollController;

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController = ScrollController();
  // }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).appBarTheme.toolbarTextStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài đặt',
          style: _style,
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          SizedBox(
            width: ResponsiveValue(
              context,
              // ignore: prefer_int_literals
              defaultValue: 200.0,
              valueWhen: [
                // ignore: prefer_int_literals
                const Condition.smallerThan(
                  name: DESKTOP,
                  // ignore: prefer_int_literals
                  value: 0.0,
                ),
              ],
            ).value,
            // height: ResponsiveValue(
            //   context,
            //   defaultValue: 0.0,
            //   valueWhen: [
            //     const Condition.smallerThan(name: DESKTOP, value: 0.0),
            //   ],
            // ).value,
            child: ResponsiveRowColumn(
              // rowMainAxisAlignment: MainAxisAlignment.start,
              // columnMainAxisAlignment: MainAxisAlignment.start,
              // rowPadding: const EdgeInsets.all(AppInsets.edge),
              columnPadding: const EdgeInsets.all(AppInsets.edge),
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                const ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(height: 48, child: ThemeSelector()),
                ),

                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SizedBox(
                    height: 48,
                    child: ThemeModeSwitch(
                      themeMode: ref.watch(themeModeControllerProvider),
                      onChanged: (newThemeMode) {
                        _updateThemeMode(ref, newThemeMode);
                      },
                    ),
                  ),
                ),
                // const ResponsiveRowColumnItem(
                //   rowFlex: 1,
                //   child: Spacer(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateThemeMode(WidgetRef ref, ThemeMode rThemeMode) async {
    // await ref.read(themeControllerProvider.notifier).setThemeMode(rThemeMode);
    await ref
        .read(themeModeControllerProvider.notifier)
        .setThemeMode(rThemeMode);
  }
}

///Container view of list of themes
