import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:yyba_app/static/app_colors.dart';
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

class _VerifyCodePage extends StatefulWidget {
  _VerifyCodePage({Key? key}) : super(key: key);

  @override
  __VerifyCodePageState createState() => __VerifyCodePageState();
}

class __VerifyCodePageState extends State<_VerifyCodePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      var arg = ModalRoute.of(context)!.settings.arguments;
      Provider.of<ViewCtrl>(context, listen: false).initPage(arg);
      Provider.of<ViewCtrl>(context, listen: false).sendCode();
    });
  }

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
                    _viewProvider.pageArgs['phone']!,
                    style: TextStyle(
                        fontSize: Pt.pt20, fontWeight: FontWeight.w600),
                  ),
                  //请输入手机号码
                  Container(
                      margin: EdgeInsets.only(top: Pt.pt40),
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            borderWidth: 1,
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: Pt.pt60,
                            fieldWidth: Pt.pt60,
                            activeFillColor: Colors.white,
                            activeColor:
                                AppColors.primaryTextColor.withOpacity(0.1),
                            inactiveColor:
                                AppColors.primaryTextColor.withOpacity(0.1),
                            selectedColor: AppColors.active),
                        animationDuration: Duration(milliseconds: 300),
                        controller: _viewProvider.verityCodeController,
                        onCompleted: (value) {},
                        onChanged: (value) {
                          _viewProvider.codeInputChange(value);
                        },
                        appContext: context,
                      )),
                  SizedBox(height: Pt.pt20),
                  Container(
                    child: Text(
                      _viewProvider.isVerityCode ? '' : '验证码错误',
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
                              60,
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
                                    _viewProvider.sendCode();
                                  },
                                );
                              },
                              countdownEnd: () {
                                _viewProvider.sendOverCode();
                              },
                            ),
                          )
                        : !_viewProvider.codeInputOver
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
                                  _viewProvider.login();
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
