import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/items/msg_item.dart';
import 'package:yyba_app/widgets/search_bars/search_container.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  final List<dynamic> sysMsgList = [
    {
      'icon': AssetsSvg.IC_HUDONGXIAOXI,
      'icColor': Color(0xff18B962),
      'name': '互动消息',
      'time': DateTime.now(),
      'msgNum': 1,
      'des': '深圳腾讯回复了你的评论'
    },
    {
      'icon': AssetsSvg.IC_FENSI,
      'icColor': Color(0xffFA6F00),
      'name': '粉丝（2132）',
      'time': DateTime.now(),
      'msgNum': 100,
      'des': '你爸突然关注了你'
    },
    {
      'icon': AssetsSvg.IC_KEFU,
      'icColor': Color(0xff2861FF),
      'name': '有源客服',
      'time': DateTime.now(),
      'msgNum': 1,
      'des': '你好，欢迎加入有源吧！'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          commonAppBar('消息', actions: [
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
                SliverToBoxAdapter(child: searchContainer()),
                SliverToBoxAdapter(
                  child: Column(
                    children: List.generate(sysMsgList.length, (index) {
                      return msgItem(sysMsgList[index]);
                    }),
                  ),
                ),
                // SliverPadding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: AppSize.appHPadding, vertical: 0),
                //   sliver: SliverList(
                //     delegate: SliverChildBuilderDelegate(
                //       (BuildContext context, int index) {
                //         return reourceItem('item');
                //       },
                //       childCount: 10,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
