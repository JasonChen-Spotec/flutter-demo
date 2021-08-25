import 'package:flutter/material.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/pt.dart';

class LoginBtn extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;

  LoginBtn(
    this.text, {
    double? width,
    double? height,
    this.color = AppColors.active,
    this.textColor = Colors.white,
    this.onTap,
  })  : width = width ?? Pt.pt310,
        height = height ?? Pt.pt48;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Pt.pt6),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: Pt.pt17, color: textColor),
        ),
      ),
    );
  }
}
