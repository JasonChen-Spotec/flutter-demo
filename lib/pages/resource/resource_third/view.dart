import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/app_bars.dart/custom_app_bar.dart';
import 'package:yyba_app/widgets/common/keep_alive.dart';
import 'package:yyba_app/widgets/common/pull_refresh.dart';
import 'package:yyba_app/widgets/items/reource_item.dart';
import 'package:yyba_app/widgets/tab_bar/custom_tab_bar.dart';

import './controller.dart';

class ResourceThirdPage extends StatelessWidget {
  const ResourceThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _ResourceThirdPage(),
    );
  }
}

class _ResourceThirdPage extends StatefulWidget {
  const _ResourceThirdPage({Key? key}) : super(key: key);

  @override
  __ResourceThirdPageState createState() => __ResourceThirdPageState();
}

class __ResourceThirdPageState extends State<_ResourceThirdPage> {
  @override
  Widget build(BuildContext context) {
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
                tabs: ['综合', 'VIP', '时间', '价格'],
                tabViewBuilder: (BuildContext _, int index) {
                  return ChangeNotifierProvider<ViewCtrl>.value(
                    value: ViewCtrl(),
                    child: keepAliveClientWrapper(_PageListView(index: index)),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PageListView extends StatefulWidget {
  final int index;

  const _PageListView({Key? key, this.index = 0}) : super(key: key);

  @override
  __PageListViewState createState() => __PageListViewState();
}

class __PageListViewState extends State<_PageListView> {
  @override
  Widget build(BuildContext context) {
    ViewCtrl _viewProvider = Provider.of<ViewCtrl>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Pt.pt16),
      child: pullRefresh(
        refreshController: _viewProvider.refreshController,
        onLoading: () => _viewProvider.onLoading(widget.index),
        onRefresh: () => _viewProvider.onRefresh(widget.index),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(top: Pt.pt16),
          itemCount: 20,
          itemBuilder: (__, int ii) {
            return reourceItem('item');
          },
        ),
      ),
    );
  }
}
