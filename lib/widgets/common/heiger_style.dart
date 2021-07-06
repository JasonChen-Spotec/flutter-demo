import 'package:flutter/material.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/pt.dart';

class OpText extends StatelessWidget {
  final String data;
  final TextAlign? align;
  final TextStyle style;

  OpText(
    this.data, {
    this.align,
    TextStyle style = const TextStyle(),
  }) : style = style.copyWith(
            fontFamily: 'Monospace',
            fontSize: style.fontSize ?? Pt.pt12,
            color: AppColors.primaryTextColorOp);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: style,
    );
  }
}

class DfText extends StatelessWidget {
  final String data;
  final TextAlign? align;
  final TextStyle style;

  DfText(
    this.data, {
    this.align,
    TextStyle style = const TextStyle(),
  }) : style = style.copyWith(
            fontFamily: 'Monospace',
            fontSize: style.fontSize ?? Pt.pt12,
            color: AppColors.primaryTextColor);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: style,
    );
  }
}
