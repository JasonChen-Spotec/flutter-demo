import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/size.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:yyba_app/widgets/app_bars.dart/custom_app_bar.dart';
import 'package:yyba_app/widgets/common/sub_title.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';

class ResourceSecondPage extends StatelessWidget {
  const ResourceSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          commonAppBar('互联网', actions: [
            Container(
              margin: EdgeInsets.only(right: Pt.pt16),
              child: SvgPicture.asset(
                AssetsSvg.IC_XIAZAI,
                color: AppColors.primaryTextColor,
              ),
            )
          ]),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: Pt.pt16, right: Pt.pt16, top: Pt.pt22),
                        child: Container(
                          width: Pt.pt343,
                          height: Pt.pt32,
                          padding: EdgeInsets.only(left: Pt.pt12),
                          decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Pt.pt32))),
                          child: DefaultTextStyle(
                            style: TextStyle(
                                color: AppColors.primaryTextColor
                                    .withOpacity(0.3)),
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
                      Container(
                        width: screen.screenWidth,
                        height: Pt.pt160,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: Pt.pt16, horizontal: Pt.pt16),
                        child: Wrap(
                          spacing: Pt.pt40,
                          runAlignment: WrapAlignment.spaceBetween,
                          alignment: WrapAlignment.spaceAround,
                          children: List.generate(8, (index) {
                            return GestureDetector(
                              onTap: () {
                                RouterCtrl.push(PAGE_RESOURCE_THIRD);
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsSvg.IC_HULIANWANG,
                                      width: Pt.pt28,
                                      height: Pt.pt28,
                                    ),
                                    SizedBox(height: Pt.pt4),
                                    Text(
                                      '互联网',
                                      style: TextStyle(fontSize: Pt.pt13),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        color: AppColors.backgroundColor,
                        padding:
                            EdgeInsets.fromLTRB(Pt.pt16, Pt.pt16, Pt.pt16, 0),
                        child: Column(
                          children: [
                            subTitle(
                              '热门资源',
                              rightChild: Row(
                                children: [
                                  Text(
                                    '更多',
                                    style: TextStyle(
                                      color: AppColors.primaryTextColorOp,
                                      fontSize: Pt.pt14,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  SvgPicture.asset(AssetsSvg.IC_XIAOJIANTOU_YOU)
                                ],
                              ),
                            ),
                            SizedBox(height: Pt.pt10),
                            Container(
                              child: Column(
                                children: List.generate(
                                  3,
                                  (index) => reourceItem('item'),
                                ),
                              ),
                            ),
                            subTitle('最新资源'),
                            SizedBox(height: Pt.pt10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.appHPadding, vertical: 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return reourceItem('item');
                      },
                      childCount: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
