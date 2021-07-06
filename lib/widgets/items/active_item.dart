import 'package:flutter/material.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/img.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

Widget activeItem(dynamic item) {
  return GestureDetector(
    onTap: () {
      RouterCtrl.push(PAGE_VIDEO_RESOURCE);
    },
    child: Container(
        height: Pt.pt120,
        padding: EdgeInsets.all(Pt.pt12),
        margin: EdgeInsets.only(bottom: Pt.pt12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    netImage(
                      imageUrl: "http://via.placeholder.com/52x52",
                      width: Pt.pt52,
                      height: Pt.pt52,
                      borderRadius: Pt.pt52,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: Pt.pt12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DfText(
                              '李俊',
                              style: TextStyle(fontSize: Pt.pt14),
                            ),
                            SizedBox(width: Pt.pt4),
                            Image.asset(
                              AssetsImg.IC_VIP1,
                              width: Pt.pt25,
                            )
                          ],
                        ),
                        SizedBox(height: Pt.pt3),
                        OpText('这个人有点懒，啥也没留下~')
                      ],
                    )
                  ],
                ),
                Text(
                  '...',
                  style: TextStyle(
                    fontSize: Pt.pt18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff969799),
                  ),
                )
              ],
            )
          ],
        )),
  );
}
