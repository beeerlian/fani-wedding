import 'package:arx/utils/color_utils.dart';
import 'package:flutter/material.dart';

export 'package:arx/theme/colors.dart';

class XAppColors {
  static final MaterialColor primaryColors =
      ColorUtility.generateMaterialColor(primary);

  static const Color primary = Color.fromARGB(255, 232, 180, 184);
  static const Color primaryLight = Color(0xFFF6CED2);
  static const Color primaryDark = Color(0xFFF6CED2);
  static const Color page = Color.fromARGB(255, 8, 8, 8);
}
