import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';

enum AlertBannerType {
  info,
  warning,
  cancel,
  success,
}

class XAlertBanner extends StatelessWidget {
  const XAlertBanner({
    super.key,
    required this.text,
    this.type = AlertBannerType.info,
  });

  final String text;
  final AlertBannerType type;

  Color get color {
    switch (type) {
      case AlertBannerType.info:
        return Colors.grey;

      case AlertBannerType.warning:
        return Colors.orange;

      case AlertBannerType.cancel:
        return Colors.red;

      case AlertBannerType.success:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.kPaddingL,
        vertical: Constants.kPaddingM,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.kRadiusS),
        gradient: LinearGradient(
          stops: const [0.01, 0.01],
          colors: [
            color.withOpacity(0.5),
            color.withOpacity(0.1),
          ],
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
      ),
    );
  }
}
