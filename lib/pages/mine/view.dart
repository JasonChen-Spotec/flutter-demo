import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/img.dart';
import 'package:yyba_app/static/size.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/btns/active_btn.dart';
import 'package:yyba_app/widgets/btns/line_btn.dart';
import 'package:yyba_app/widgets/common/cached_network_image.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final List<dynamic> numInfoList = [
    {'label': '粉丝', 'val': 80},
    {'label': '关注', 'val': 80},
    {'label': '空间', 'val': 80},
    {'label': '邀请', 'val': 80},
  ];

  final List<dynamic> funcList = [
    {'icon': AssetsSvg.IC_DINGDAN, 'name': '订单'},
    {'icon': AssetsSvg.IC_WODE_SHOUCANG, 'name': '收藏'},
    {'icon': AssetsSvg.IC_WODE_XIAZAI, 'name': '下载'},
    {'icon': AssetsSvg.IC_ZIYUAN, 'name': '资源管理'},
    {'icon': AssetsSvg.IC_JILU, 'name': '记录'},
  ];

  final List<dynamic> orderList = [
    {'icon': AssetsSvg.IC_YAOQING, 'name': '订单', 'des': '邀请一人送99积分'},
    {'icon': AssetsSvg.IC_HUODONGZHONGXIN, 'name': '收藏', 'des': '五一期间活动乐不停'},
    {'icon': AssetsSvg.IC_DUIHUANMA, 'name': '下载', 'des': ''},
    {'icon': AssetsSvg.IC_GUANYU, 'name': '资源管理', 'des': ''},
    {'icon': AssetsSvg.IC_SHEZHI, 'name': '设置', 'des': '账号/通知'},
  ];

  final List<dynamic> accountNumList = [
    {'num': 212, 'name': '积分'},
    {'num': 222, 'name': '卡券'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appHPadding),
            child: Column(
              children: [
                SizedBox(height: Pt.pt12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          netImage(
                            imageUrl: "http://via.placeholder.com/52x52",
                            width: Pt.pt52,
                            height: Pt.pt52,
                            borderRadius: Pt.pt52,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: Pt.pt16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '吕治易',
                                    style: TextStyle(fontSize: Pt.pt22),
                                  ),
                                  SizedBox(width: Pt.pt10),
                                  Image.asset(AssetsImg.IC_VIP1, width: Pt.pt25)
                                ],
                              ),
                              Text(
                                '账号45678',
                                style: TextStyle(
                                  color: AppColors.primaryTextColorOp,
                                  fontSize: Pt.pt14,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      AssetsSvg.IC_SAOYISAO,
                      width: Pt.pt20,
                      height: Pt.pt20,
                      color: AppColors.primaryTextColor,
                    )
                  ],
                ),
                SizedBox(height: Pt.pt22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(numInfoList.length, (index) {
                    var item = numInfoList[index];
                    return Column(
                      children: [
                        Text(
                          item['val'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: Pt.pt17),
                        ),
                        SizedBox(height: Pt.pt5),
                        Text(
                          item['label'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Pt.pt12,
                              color: AppColors.primaryTextColorOp),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: Pt.pt24),
                Container(
                  height: Pt.pt162,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: Pt.pt16,
                          right: Pt.pt16,
                          left: Pt.pt16,
                          bottom: Pt.pt33,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage(AssetsImg.VIP_BG),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                netImage(
                                  imageUrl: "http://via.placeholder.com/52x52",
                                  width: Pt.pt43,
                                  height: Pt.pt43,
                                  borderRadius: Pt.pt52,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: Pt.pt12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('体验会员',
                                        style: TextStyle(
                                            fontSize: Pt.pt17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                    SizedBox(height: Pt.pt2),
                                    Text('距离到期还剩：136天',
                                        style: TextStyle(
                                            fontSize: Pt.pt12,
                                            color:
                                                Colors.white.withOpacity(0.75)))
                                  ],
                                )
                              ],
                            ),
                            LineBtn('续费')
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: Pt.pt78,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Pt.pt16, vertical: Pt.pt18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Pt.pt6),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(funcList.length, (index) {
                              var item = funcList[index];
                              return Column(
                                children: [
                                  SvgPicture.asset(
                                    item['icon'],
                                    width: Pt.pt24,
                                    height: Pt.pt24,
                                    color: AppColors.primaryTextColor,
                                  ),
                                  SizedBox(height: Pt.pt4),
                                  Text(
                                    item['name'],
                                    style: TextStyle(
                                      fontSize: Pt.pt12,
                                      color: AppColors.primaryTextColor,
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Pt.pt12),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Pt.pt6),
                      color: Colors.white),
                  padding: EdgeInsets.all(Pt.pt16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DfText(
                            '我的账户',
                            style: TextStyle(fontSize: Pt.pt17),
                          ),
                          Row(children: [
                            OpText(
                              '详情',
                              style: TextStyle(fontSize: Pt.pt14),
                            ),
                            SizedBox(
                              width: Pt.pt5,
                            ),
                            SvgPicture.asset(AssetsSvg.IC_JIANTOU_YOU),
                          ]),
                        ],
                      ),
                      SizedBox(height: Pt.pt12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DfText(
                                '余额 45678.02',
                                style: TextStyle(
                                    fontSize: Pt.pt17,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: Pt.pt2),
                              Text(
                                '充值领红包，最高可得888元',
                                style: TextStyle(
                                    fontSize: Pt.pt12,
                                    color: Color(0xffFA6F00)),
                              )
                            ],
                          ),
                          ActiveBtn('充值')
                        ],
                      ),
                      SizedBox(height: Pt.pt12),
                      Row(
                        children: List.generate(accountNumList.length, (index) {
                          var _item = accountNumList[index];
                          return Container(
                            alignment: Alignment.center,
                            width: Pt.pt148,
                            height: Pt.pt59,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Pt.pt3),
                              border: Border.all(
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.1),
                                  width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DfText(
                                  _item['num'].toString(),
                                  style: TextStyle(
                                      fontSize: Pt.pt17,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: Pt.pt2),
                                OpText(_item['name'])
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Pt.pt12),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Pt.pt6),
                        color: Colors.white),
                    child: Column(
                      children: List.generate(orderList.length, (index) {
                        var _item = orderList[index];
                        return Container(
                          padding: EdgeInsets.all(Pt.pt16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(_item['icon']),
                                  SizedBox(width: Pt.pt12),
                                  DfText(
                                    _item['name'],
                                    style: TextStyle(fontSize: Pt.pt17),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  OpText(_item['des']),
                                  SizedBox(width: Pt.pt4),
                                  SvgPicture.asset(AssetsSvg.IC_JIANTOU_YOU),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
