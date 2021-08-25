import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/model/res.dart';
import 'package:yyba_app/model/res_type.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/size.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';
import 'package:yyba_app/widgets/common/sub_title.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';
import 'package:yyba_app/widgets/search_bars/search_container.dart';

import 'controller.dart';

class ResourceSecondPage extends ProviderView<ViewCtrl> {
  ResourceSecondPage({Key? key}) : super(key: key, controller: ViewCtrl());
  @override
  _ResourceSecondPage createState() => _ResourceSecondPage();
}

class _ResourceSecondPage extends ProviderViewState<ResourceSecondPage>
    with BaseControllerMixin<ResourceSecondPage> {
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          commonAppBar(widget.controller.pageArgs['name'] ?? '', actions: [
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
                      searchContainer(),
                      Container(
                        width: screen.screenWidth,
                        height: Pt.pt160,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: Pt.pt16, horizontal: Pt.pt16),
                        child: Wrap(
                          spacing: Pt.pt35,
                          runAlignment: WrapAlignment.spaceBetween,
                          alignment: WrapAlignment.spaceAround,
                          children: List.generate(
                              widget.controller.resTypes.length, (index) {
                            ResType item = widget.controller.resTypes[index];
                            return GestureDetector(
                              onTap: () {
                                widget.controller.toThirdPage(item);
                              },
                              child: Container(
                                width: Pt.pt53,
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
                                      item.name != null ? item.name! : '',
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
                                  (index) => reourceItem(Res()),
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
                        return reourceItem(Res());
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
