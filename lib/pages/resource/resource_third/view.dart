import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/common/keep_alive.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';
import 'package:yyba_app/widgets/common/pull_refresh.dart';
import 'package:yyba_app/widgets/hooks/use_load_list.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';
import 'package:yyba_app/widgets/tab_bar/custom_tab_bar.dart';

import './controller.dart';

class ResourceThirdPage extends ProviderView<ViewCtrl> {
  ResourceThirdPage({Key? key}) : super(key: key, controller: ViewCtrl());
  @override
  _ResourceThirdPage createState() => _ResourceThirdPage();
}

class _ResourceThirdPage extends ProviderViewState<ResourceThirdPage>
    with BaseControllerMixin<ResourceThirdPage> {
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          commonAppBar('前端', actions: [
            SvgPicture.asset(
              AssetsSvg.IC_SOUSUO,
              width: Pt.pt16,
              color: AppColors.primaryTextColor,
            ),
            SizedBox(width: Pt.pt20),
            SvgPicture.asset(
              AssetsSvg.IC_XIAZAI,
              width: Pt.pt16,
              color: AppColors.primaryTextColor,
            ),
            SizedBox(width: Pt.pt16)
          ]),
          Expanded(
            child: Container(
              child: CustomScrollTabBarView(
                backgroundColor: Colors.white,
                padding: EdgeInsets.only(left: Pt.pt16, bottom: Pt.pt10),
                tabs: widget.controller.tabList,
                onTabChange: (int index) {
                  widget.controller.onTabChange(index);
                },
                tabViewBuilder: (BuildContext _, int index) {
                  return keepAliveClientWrapper(_PageListView(
                      index: index, controller: widget.controller));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PageListView extends StatefulHookWidget {
  final int index;
  final ViewCtrl controller;

  const _PageListView({Key? key, this.index = 0, required this.controller})
      : super(key: key);

  @override
  __PageListViewState createState() => __PageListViewState();
}

class __PageListViewState extends State<_PageListView> {
  @override
  Widget build(BuildContext context) {
    final LoadListHookRes listControl =
        useLoadList(context, widget.controller.getList);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Pt.pt16),
      child: pullRefresh(
        refreshController: widget.controller.refreshController,
        onLoading: () => listControl.onLoading!(),
        onRefresh: () => listControl.onRefresh!(),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(top: Pt.pt16),
          itemCount: listControl.resList.length,
          itemBuilder: (__, int ii) {
            return reourceItem(listControl.resList[ii]);
          },
        ),
      ),
    );
  }
}
