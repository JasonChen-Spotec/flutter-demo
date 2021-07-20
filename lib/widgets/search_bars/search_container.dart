import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';

Widget searchContainer({void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: Pt.pt16, right: Pt.pt16, top: Pt.pt10),
      child: Container(
        width: Pt.pt343,
        height: Pt.pt32,
        padding: EdgeInsets.only(left: Pt.pt12),
        decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.all(Radius.circular(Pt.pt32))),
        child: DefaultTextStyle(
          style: TextStyle(color: AppColors.primaryTextColor.withOpacity(0.3)),
          child: Row(
            children: [
              SvgPicture.asset(AssetsSvg.IC_SOUSUO),
              SizedBox(width: Pt.pt10),
              Text('搜索...')
            ],
          ),
        ),
      ),
    ),
  );
}
