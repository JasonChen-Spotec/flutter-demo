import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/model/res_type.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/carousel/carousel.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';
import 'package:yyba_app/widgets/tab_bar/custom_tab_bar.dart';

import 'controller.dart';

class ResourcePage extends ProviderView<ViewCtrl> {
  ResourcePage({Key? key}) : super(key: key, controller: ViewCtrl());

  @override
  _ResourcePage createState() => _ResourcePage();
}

class _ResourcePage extends ProviderViewState<ResourcePage>
    with BaseControllerMixin<ResourcePage> {
  @override
  Widget body(BuildContext context) {
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
                  child: SvgPicture.asset(
                    AssetsSvg.IC_XIAZAI,
                    color: AppColors.primaryTextColor,
                  ),
                )
              ],
            ),
            SizedBox(height: Pt.pt10),
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
                      margin: EdgeInsets.only(top: Pt.pt12),
                      padding: EdgeInsets.symmetric(
                          vertical: Pt.pt16, horizontal: Pt.pt16),
                      child: Wrap(
                        spacing: Pt.pt40,
                        runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.spaceAround,
                        children: List.generate(
                            widget.controller.resTypes.length, (index) {
                          ResType item = widget.controller.resTypes[index];
                          return GestureDetector(
                            onTap: () {
                              widget.controller.toSecondPage(item);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SvgPicture.network(
                                    item.icon != null
                                        ? item.icon!
                                        : 'https://yyb-pub-1.oss-cn-beijing.aliyuncs.com/互联网_RD1ALjEpMYsdN3rVozVtZ.svg',
                                    width: Pt.pt28,
                                    height: Pt.pt28,
                                    color: AppColors.active,
                                  ),
                                  SizedBox(height: Pt.pt4),
                                  Text(
                                    item.name!,
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
                      margin: EdgeInsets.only(bottom: Pt.pt12),
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
                padding: EdgeInsets.only(bottom: Pt.pt10),
                tabs: widget.controller.recommendTabs,
                onTabChange: (int index) {
                  widget.controller.onTabChange(index);
                },
                tabViewBuilder: (BuildContext _, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: Pt.pt2),
                    child: ListView.builder(
                        itemCount: widget.controller.resList.length,
                        itemBuilder: (__, int ii) {
                          return reourceItem(widget.controller.resList[ii]);
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
