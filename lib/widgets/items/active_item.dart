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
                      width: Pt.pt44,
                      height: Pt.pt44,
                      borderRadius: Pt.pt44,
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
            ),
            SizedBox(height: Pt.pt12),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Pt.pt3),
              ),
              child: Row(
                children: [
                  netImage(
                      imageUrl: 'http://via.placeholder.com/350x150',
                      width: Pt.pt67,
                      height: Pt.pt67),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(Pt.pt12),
                      color: Color(0xffF5F5F5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DfText(
                                '富爸爸穷爸爸的进阶版',
                                style: TextStyle(fontSize: Pt.pt16),
                              ),
                              SizedBox(width: Pt.pt4),
                              Image.asset(AssetsImg.IC_VIP1, width: Pt.pt27)
                            ],
                          ),
                          SizedBox(height: Pt.pt4),
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Pt.pt12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OpText('45下载 · 567收藏'),
                OpText('5分钟前'),
              ],
            )
          ],
        )),
  );
}
