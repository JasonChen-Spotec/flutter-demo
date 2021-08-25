import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/model/res.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

class _CtrlStatic {
  String icon = '';
  int nunVal = 0;
  _CtrlStatic(this.icon, this.nunVal);
}

Widget reourceItem(Res item) {
  final List<_CtrlStatic> ctrlStatic = [
    _CtrlStatic(AssetsSvg.IC_LIULAN, item.viewed_count ?? 0),
    _CtrlStatic(AssetsSvg.IC_XIAZAILIANG, item.bought_count ?? 0),
    _CtrlStatic(AssetsSvg.IC_SHOUCANG, item.favorite_count ?? 0),
  ];

  return GestureDetector(
    onTap: () {
      RouterCtrl.push(PAGE_VIDEO_RESOURCE);
    },
    child: Container(
      height: Pt.pt120,
      padding: EdgeInsets.all(Pt.pt12),
      margin: EdgeInsets.only(bottom: Pt.pt12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
      child: Row(
        children: [
          netImage(
            imageUrl: item.cover ?? "http://via.placeholder.com/350x150",
            borderRadius: Pt.pt2,
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
              Container(
                width: Pt.pt190,
                child: Text(
                  item.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Pt.pt16,
                    fontWeight: FontWeight.w600,
                  ),
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
    ),
  );
}
