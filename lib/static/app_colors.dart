import 'package:flutter/material.dart';

class AppColors {
  /// 无背景的一级字体颜色 #0xff333333
  static const Color mainTextColor33 = Color(0xFF333333);

  /// 无背景的二级字体颜色 #0xff666666
  static const Color subTextColor66 = Color(0xFF666666);

  /// 提示颜色，一般是输入框hint #0xFF999999
  static const Color tipTextColor99 = Color(0xFF999999);

  static Color backgroundColor = Color(0xFFf7f7f7);
  static Color videoBgColor = Colors.black.withOpacity(0.75);

  static Color appBarColor = Colors.black;
  static const Color primaryColor = Color(0xFFFF3038);
  static const Color primaryRaised = Color(0xFFEB2A2A);
  static const Color textColorWhite = Colors.white;

  // #0xFF3A3A44 disable color
  static const Color primaryDisable = Color(0xFF3A3A44);
  // #0xFF3A3A44 disable color
  static const Color divideColor = Color(0xFF3A3A44);

  /// 主板色，凸出部分/前景色带渐变，主凸板色 #0xFFF5164E-0xFFFF6538
  static const primaryRaiseds = <Color>[
    Color(0xFFF5164E),
    Color(0xFFFF6538),
  ];
}
