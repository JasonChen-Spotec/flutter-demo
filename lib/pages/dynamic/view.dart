import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/common/pull_refresh.dart';
import 'package:yyba_app/widgets/items/active_item.dart';

import 'controller.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _DynamicPage(),
    );
  }
}

class _DynamicPage extends StatelessWidget {
  const _DynamicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewCtrl _viewProvider = Provider.of<ViewCtrl>(context);
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
                  '动态',
                  style:
                      TextStyle(fontSize: Pt.pt20, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: Pt.pt32,
                  height: Pt.pt32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: SvgPicture.asset(
                    AssetsSvg.IC_SOUSUO,
                    color: AppColors.primaryTextColor,
                  ),
                )
              ],
            ),
            SizedBox(height: Pt.pt10),
            Expanded(
              child: pullRefresh(
                refreshController: _viewProvider.refreshController,
                onLoading: () => _viewProvider.onLoading(),
                onRefresh: () => _viewProvider.onRefresh(),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: Pt.pt12),
                  itemCount: 20,
                  itemBuilder: (__, int ii) {
                    return activeItem('item');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
