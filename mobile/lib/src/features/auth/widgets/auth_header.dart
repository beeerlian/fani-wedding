import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: Constants.kPaddingXL),
          SizedBox(
            height: 150,
            child: Assets.apps.logo.image(
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: Constants.kPaddingL),
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: Constants.kPaddingL),
        ],
      ),
    );
  }
}
