import 'package:arx/theme/colors.dart';
import 'package:flutter/material.dart';

class XDivider extends StatelessWidget {
  const XDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      color: XColors.grey_40,
    );
  }
}
