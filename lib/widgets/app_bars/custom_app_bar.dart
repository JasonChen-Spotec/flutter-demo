import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/size.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/utils/screen.dart';

/// 获取统一通用的appbar
Widget commonAppBar(String title,
    {VoidCallback? onBack, bool centerTitle = false, List<Widget>? actions}) {
  return AppBar(
    centerTitle: centerTitle,
    titleSpacing: .0,
    title: Text(
      title,
      style: TextStyle(
        fontSize: Pt.pt18,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    leading: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: Pt.pt6),
        padding: EdgeInsets.symmetric(vertical: Pt.pt14),
        child: SvgPicture.asset(
          AssetsSvg.IC_BACK,
          color: AppColors.primaryTextColor,
        ),
      ),
      onTap: () {
        if (onBack == null) {
          return RouterCtrl.pop();
        }
        onBack();
      },
    ),
    actions: actions,
  );
}

/// 透明的appbar
Widget transparentAppbar(String title,
    {VoidCallback? onBack, List<Widget>? action}) {
  return Container(
    width: screen.screenWidth,
    height: kToolbarHeight + screen.paddingTop,
    padding: EdgeInsets.only(
        right: AppSize.appHPadding,
        top: screen.paddingTop,
        left: AppSize.appHPadding),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          left: 0,
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 4),
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                AssetsSvg.IC_BACK,
                width: 28,
                height: 28,
              ),
            ),
            onTap: () {
              if (onBack == null) {
                return RouterCtrl.pop();
              }
              onBack();
            },
          ),
        ),
        Text(title,
            style: TextStyle(
                fontSize: Pt.pt18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none)),
        Positioned(
          right: 0,
          child: Row(
            children: action ?? [],
          ),
        ),
      ],
    ),
  );
}
