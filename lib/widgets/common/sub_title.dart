import 'package:flutter/material.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/pt.dart';

Widget subTitle(String title, {Widget? rightChild}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: Pt.pt17,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w600),
        ),
        Container(child: rightChild)
      ],
    ),
  );
}
