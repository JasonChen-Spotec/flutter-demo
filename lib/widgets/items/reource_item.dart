import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

class _CtrlStatic {
  String icon = '';
  int nunVal = 0;
  _CtrlStatic(this.icon, this.nunVal);
}

Widget reourceItem(dynamic item) {
  final List<_CtrlStatic> ctrlStatic = [
    _CtrlStatic(AssetsSvg.IC_LIULAN, 12),
    _CtrlStatic(AssetsSvg.IC_XIAZAILIANG, 12),
    _CtrlStatic(AssetsSvg.IC_SHOUCANG, 12),
  ];

  return Container(
    height: Pt.pt120,
    padding: EdgeInsets.all(Pt.pt12),
    margin: EdgeInsets.only(bottom: Pt.pt12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(2)),
    child: Row(
      children: [
        netImage(
          imageUrl: "http://via.placeholder.com/350x150",
          borderRadius: 2,
          width: Pt.pt96,
          height: Pt.pt96,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: Pt.pt12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '富爸爸穷爸爸的进阶版',
              style: TextStyle(
                fontSize: Pt.pt16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(children: [
              OpText('#'),
              SizedBox(width: Pt.pt5),
              ...List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.only(right: Pt.pt8),
                  child: OpText('有声书籍'),
                );
              }),
            ]),
            Row(
              children: List.generate(ctrlStatic.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: Pt.pt24),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ctrlStatic[index].icon,
                        width: Pt.pt12,
                        height: Pt.pt12,
                      ),
                      SizedBox(width: Pt.pt3),
                      OpText(ctrlStatic[index].nunVal.toString())
                    ],
                  ),
                );
              }),
            )
          ],
        )
      ],
    ),
  );
}
