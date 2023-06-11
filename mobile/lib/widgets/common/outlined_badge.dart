import 'package:arx/config/constants/constants.dart';
import 'package:arx/theme/colors.dart';
import 'package:flutter/material.dart';

class XOutliedBadge extends StatelessWidget {
  const XOutliedBadge({super.key, this.icon, required this.text, this.color});

  final IconData? icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.kPaddingS,
        vertical: Constants.kPaddingXS * 0.75,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.kRadiusL),
        border: Border.all(color: color ?? XColors.grey_80, width: 0.4),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon!,
              size: Constants.kFontSizeL,
              color: color ?? XColors.grey_80,
            ),
          const SizedBox(width: Constants.kPaddingXS),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
