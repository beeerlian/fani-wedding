import 'dart:math' as math;

import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../src/theme/colors.dart';

const double _kTabHeight = 46.0;

class XTabBar extends StatelessWidget implements PreferredSizeWidget {
  const XTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
    this.onTap,
    this.isScrollable = false,
  }) : super(key: key);

  final TabController controller;
  final List<Widget> tabs;
  final Function(int)? onTap;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      labelColor: XAppColors.primary,
      indicatorColor: XAppColors.primary,
      unselectedLabelColor: XColors.grey_60,
      labelStyle: Theme.of(context).textTheme.headline6,
      unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
      indicatorWeight: Constants.kPaddingXS,
      isScrollable: isScrollable,
      controller: controller,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize {
    double maxHeight = _kTabHeight;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + 2);
  }
}
