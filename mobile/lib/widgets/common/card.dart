import 'package:arx/config/constants/constants.dart';
import 'package:arx/theme/colors.dart';
import 'package:flutter/material.dart';

class XCard extends StatelessWidget {
  const XCard({
    Key? key,
    this.child,
    this.margin,
    this.padding,
    this.withPadding = true,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ??
          ((withPadding == true)
              ? const EdgeInsets.all(Constants.kPaddingM)
              : null),
      decoration: BoxDecoration(
        color: XColors.white,
        borderRadius: BorderRadius.circular(Constants.kRadiusL),
        boxShadow: const [
          BoxShadow(
            color: XColors.grey_20,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
