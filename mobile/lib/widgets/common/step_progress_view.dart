import 'package:arx/config/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../src/theme/colors.dart';

class StepProgressView extends StatelessWidget {
  const StepProgressView({
    super.key,
    required this.icons,
    required this.titles,
    required this.currentStep,
    required this.activeColor,
  });

  final List<IconData> icons;
  final List<String> titles;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor = XColors.grey_20;
  final double lineWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: _iconViews(context),
        ),
      ],
    );
  }

  List<Widget> _iconViews(BuildContext context) {
    var list = <Widget>[];
    icons.asMap().forEach((i, icon) {
      //colors according to state
      var circleColor = (i == 0 || currentStep > i) && (currentStep != 0)
          ? activeColor
          : inactiveColor;

      var iconColor = (i == 0 || currentStep > i) && (currentStep != 0)
          ? inactiveColor
          : activeColor;

      list.add(
        //dot with icon view
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: lineWidth,
                      color: i == 0 ? Colors.transparent : XColors.grey_40,
                    ),
                  ),
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      border: Border.all(
                        color: activeColor,
                        width: 1.0,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 15.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: lineWidth,
                      color: i == icons.length - 1
                          ? Colors.transparent
                          : XColors.grey_40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Constants.kPaddingS),
              AutoSizeText(
                titles[i],
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: XAppColors.primary),
                textAlign: TextAlign.center,
                maxLines: 2,
                minFontSize: Constants.kFontSizeXS,
              ),
            ],
          ),
        ),
      );
    });

    return list;
  }
}
