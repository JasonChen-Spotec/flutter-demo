import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';
import 'package:date_format/date_format.dart' as fmt;

Widget msgItem(item) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: Pt.pt12, vertical: Pt.pt16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: Pt.pt62,
              height: Pt.pt62,
              padding: EdgeInsets.all(Pt.pt20),
              decoration: BoxDecoration(
                  color: item['icColor'],
                  borderRadius: BorderRadius.circular(80)),
              child: SvgPicture.asset(
                item['icon'],
                color: Colors.white,
              ),
            ),
            SizedBox(width: Pt.pt16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DfText(item['name'],
                    style: TextStyle(
                        fontSize: Pt.pt17, fontWeight: FontWeight.w500)),
                SizedBox(height: Pt.pt4),
                OpText(item['des'], style: TextStyle(fontSize: Pt.pt14))
              ],
            )
          ],
        ),
        Column(
          children: [
            OpText(
              fmt.formatDate(item['time'], [fmt.HH, ':', fmt.mm]),
              style: TextStyle(fontSize: Pt.pt14),
            ),
            SizedBox(height: Pt.pt4),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
              child: Text(
                item['msgNum'] > 99 ? '99+' : item['msgNum'].toString(),
                style: TextStyle(fontSize: Pt.pt11, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
            )
          ],
        )
      ],
    ),
  );
}
