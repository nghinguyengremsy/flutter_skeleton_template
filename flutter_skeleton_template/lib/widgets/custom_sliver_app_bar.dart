// ignore_for_file: always_use_package_imports, public_member_api_docs

import 'package:flutter/material.dart';

import '../config/config.dart';

///CUSTOM SLIVER APPBAR
class CustomSliverAppBar extends StatelessWidget {
  ///CONSTRUCTOR
  const CustomSliverAppBar({
    Key? key,
    required String title,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.backgroundUrl,
  })  : _title = title,
        super(key: key);

  final String _title;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final String? backgroundUrl;
  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context)
        .appBarTheme
        .titleTextStyle!
        .copyWith(fontWeight: FontWeight.bold);
    return SliverAppBar(
      expandedHeight: 60,
      pinned: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          backgroundUrl ?? AppConst.pageAppbarBgImg,
          fit: BoxFit.cover,
        ),
        stretchModes: const [StretchMode.fadeTitle],
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                _title,
                style: _style,
              ),
            ],
          ),
        ),
      ),
      leading: leading,
      actions: actions,
    );
  }
}
