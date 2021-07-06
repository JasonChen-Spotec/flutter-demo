import 'package:flutter/material.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/pt.dart';

class ActiveBtn extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? pading;
  final void Function()? onTap;
  final Color color;

  ActiveBtn(
    this.text, {
    EdgeInsetsGeometry? pading = const EdgeInsets.all(0),
    Color color = Colors.white,
    this.onTap,
  })  : pading = EdgeInsets.symmetric(horizontal: Pt.pt15, vertical: Pt.pt5),
        color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.active,
        borderRadius: BorderRadius.circular(Pt.pt100),
      ),
      padding: pading,
      child: Text(
        text,
        style: TextStyle(fontSize: Pt.pt12, color: color),
      ),
    );
  }
}
