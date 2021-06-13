import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/carousel/carousel.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';
import 'package:yyba_app/widgets/tab_bar/custom_tab_bar.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Pt.pt16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '资源',
                  style:
                      TextStyle(fontSize: Pt.pt20, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: Pt.pt220,
                  height: Pt.pt32,
                  padding: EdgeInsets.only(left: Pt.pt12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(Pt.pt32))),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        color: AppColors.primaryTextColor.withOpacity(0.3)),
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetsSvg.IC_SOUSUO),
                        SizedBox(width: Pt.pt10),
                        Text('搜索...')
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Pt.pt32,
                  height: Pt.pt32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: SvgPicture.asset(AssetsSvg.IC_XIAZAI),
                )
              ],
            ),
            Expanded(
              child: CustomScrollTabBarView(
                otherChild: Column(
                  children: [
                    Container(
                      width: Pt.pt343,
                      height: Pt.pt160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Pt.pt6),
                      ),
                      margin: EdgeInsets.only(top: Pt.pt22),
                      padding: EdgeInsets.symmetric(
                          vertical: Pt.pt16, horizontal: Pt.pt16),
                      child: Wrap(
                        spacing: Pt.pt40,
                        runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.spaceAround,
                        children: List.generate(8, (index) {
                          return GestureDetector(
                            onTap: () {
                              RouterCtrl.push(PAGE_RESOURCE_SECOND);
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
                    SizedBox(height: Pt.pt16),
                    Carousel(
                      [{}, {}, {}],
                      borderRadius: Pt.pt6,
                      itemBuilder: (BuildContext context, int index) {
                        return netImage(
                            imageUrl: "http://via.placeholder.com/350x150");
                      },
                    ),
                    SizedBox(height: Pt.pt24),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: Pt.pt10),
                      child: Text(
                        '为你推荐',
                        style: TextStyle(
                          fontSize: Pt.pt17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                tabs: ['热门', '科技', '数据', '运营', '教育'],
                tabViewBuilder: (BuildContext _, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: Pt.pt12),
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (__, int ii) {
                          return reourceItem('item');
                        }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
