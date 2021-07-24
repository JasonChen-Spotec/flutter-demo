import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/btns/login_btn.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

import 'area_code_sheet.dart';
import 'controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  _LoginPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ViewCtrl _viewProvider = Provider.of<ViewCtrl>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          commonAppBar('登陆', actions: []),
          Expanded(
            child: Container(
              color: Colors.white,
              width: screen.screenWidth,
              padding:
                  EdgeInsets.symmetric(vertical: Pt.pt40, horizontal: Pt.pt32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DfText(
                    '请输入您的手机号',
                    style: TextStyle(
                        fontSize: Pt.pt20, fontWeight: FontWeight.w600),
                  ),
                  //请输入手机号码
                  Container(
                    margin: EdgeInsets.only(top: Pt.pt40),
                    padding: EdgeInsets.only(bottom: Pt.pt12),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryTextColor.withOpacity(0.3),
                      ),
                    )),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showPicker(_viewProvider);
                          },
                          child: Container(
                            width: Pt.pt55,
                            child: Row(
                              children: [
                                DfText(
                                  _viewProvider.areaCode,
                                  style: TextStyle(fontSize: Pt.pt17),
                                ),
                                SizedBox(width: Pt.pt5),
                                SvgPicture.asset(
                                  AssetsSvg.IC_JIANTOU_XIA,
                                  width: Pt.pt12,
                                  color: AppColors.primaryTextColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: Pt.pt17),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _viewProvider.phoneController,
                            decoration: InputDecoration(
                              hintText: '请输入手机号',
                              hintStyle: TextStyle(
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.3),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.only(
                                  start: Pt.pt15, end: Pt.pt15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Pt.pt20),
                  _viewProvider.phoneError
                      ? Container(
                          child: Text(
                            '手机号码错误',
                            style: TextStyle(
                                color: Color(0xffF41111), fontSize: Pt.pt14),
                          ),
                        )
                      : Container(),
                  SizedBox(height: Pt.pt40),
                  Container(
                    child: LoginBtn(
                      '下一步',
                      onTap: () {
                        _viewProvider.loginNext();
                      },
                    ),
                  ),
                  SizedBox(height: Pt.pt24),
                  Center(
                    child: OpText(
                      '注册/登录既表示同意《有源吧平台服务协议》',
                      style: TextStyle(fontSize: Pt.pt14),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
