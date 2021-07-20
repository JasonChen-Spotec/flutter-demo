import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:yyba_app/widgets/app_bars/custom_app_bar.dart';
import 'package:yyba_app/widgets/btns/login_btn.dart';
import 'package:yyba_app/widgets/common/count_timer_builder.dart';
import 'package:yyba_app/widgets/common/heiger_style.dart';

import 'controller.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _VerifyCodePage(),
    );
  }
}

class _VerifyCodePage extends StatelessWidget {
  const _VerifyCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewCtrl _viewProvider = Provider.of<ViewCtrl>(context);
    return Scaffold(
      body: Column(
        children: [
          commonAppBar('验证码', actions: []),
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
                    '4位验证码已发送至：',
                    style: TextStyle(fontSize: Pt.pt14),
                  ),
                  SizedBox(height: Pt.pt4),
                  DfText(
                    '18284374747',
                    style: TextStyle(
                        fontSize: Pt.pt20, fontWeight: FontWeight.w600),
                  ),
                  //请输入手机号码
                  Container(
                    margin: EdgeInsets.only(top: Pt.pt40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate([1, 2, 3, 4].length, (index) {
                        _viewProvider.phoneController.value =
                            TextEditingValue(text: '1');
                        return Container(
                          width: Pt.pt60,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.3),
                              ),
                            ),
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: Pt.pt17),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _viewProvider.phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.only(
                                  start: Pt.pt20, end: Pt.pt20),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: Pt.pt20),
                  Container(
                    child: Text(
                      '验证码错误',
                      style: TextStyle(
                          color: Color(0xffF41111), fontSize: Pt.pt14),
                    ),
                  ),
                  SizedBox(height: Pt.pt40),
                  Container(
                    child: _viewProvider.codeIsSending
                        ? Container(
                            height: Pt.pt48,
                            child: CountTimer(
                              5,
                              timerBuilder: (context,
                                  {String? day,
                                  String? hour,
                                  String? minute,
                                  String? second,
                                  int? time}) {
                                return LoginBtn(
                                  '$second秒后重发',
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.1),
                                  textColor: AppColors.primaryTextColorOp,
                                  onTap: () {
                                    _viewProvider.sendCodeAgain();
                                  },
                                );
                              },
                              countdownEnd: () {
                                _viewProvider.sendOverCode();
                              },
                            ),
                          )
                        : _viewProvider.codeSendOver
                            ? LoginBtn(
                                '重新发送',
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.1),
                                textColor: AppColors.primaryTextColorOp,
                                onTap: () {
                                  _viewProvider.sendCode();
                                },
                              )
                            : LoginBtn(
                                '下一步',
                                onTap: () {
                                  _viewProvider.sendCode();
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
