import 'package:arx/config/constants/constants.dart';
import 'package:arx/config/constants/screen.dart';
import 'package:arx/widgets/common/head_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../src/router/coordinator.dart';
import '../../src/theme/colors.dart';

class XBottomSheet {
  static get context => XCoordinator.context;

  static hide() {
    Navigator.of(context).pop();
  }

  static showStyleThree(Widget child) {
    final double sh = XScreens.height;

    XBottomSheet.show(child, height: sh - 176);
  }

  static showStyleTwo(Widget child) {
    final double sh = XScreens.height;

    XBottomSheet.show(
      child,
      backgroundColor: XColors.white,
      height: sh < 650 ? sh : sh * 0.8,
      withHorizontalPadding: false,
      withTopBar: false,
      withTopPadding: false,
    );
  }

  static show(
    Widget child, {
    double? height,
    Widget? floatingActionButton,
    bool withHorizontalPadding = true,
    bool withTopPadding = true,
    bool withTopBar = true,
    Color? backgroundColor,
    Color? barrierColor,
    bool enableDrag = true,
  }) {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(Constants.kRadiusL),
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      context: context,
      builder: (context) {
        return _wrapper(
          height,
          floatingActionButton,
          withHorizontalPadding,
          withTopPadding,
          withTopBar,
          child,
          backgroundColor: backgroundColor,
        );
      },
    );
  }

  static SizedBox _wrapper(
    double? height,
    Widget? floatingActionButton,
    bool withHorizontalPadding,
    bool withTopPadding,
    bool withTopBar,
    Widget child, {
    Color? backgroundColor,
  }) {
    return SizedBox(
      height: height,
      child: Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        body: AnimationConfiguration.synchronized(
          duration: const Duration(milliseconds: 475),
          child: FadeInAnimation(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: withHorizontalPadding ? Constants.kPaddingL : 0,
              ),
              child: withTopPadding
                  ? Column(
                      children: [
                        if (withTopBar) const Center(child: XHeadBar()),
                        const SizedBox(height: Constants.kPaddingS),
                        Expanded(
                          child: child,
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        child,
                        if (withTopBar)
                          const Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: XHeadBar(color: XColors.white),
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
