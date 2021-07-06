import 'package:flutter/material.dart';
import 'package:yyba_app/utils/pt.dart';

class LineBtn extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? pading;
  final void Function()? onTap;
  final Color color;

  LineBtn(
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
        border: Border.all(color: color, width: 1),
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
