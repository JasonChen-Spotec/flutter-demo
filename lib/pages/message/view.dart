import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/items/msg_item.dart';

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
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: Pt.pt16, right: Pt.pt16, top: Pt.pt10),
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
                  ),
                ),
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
