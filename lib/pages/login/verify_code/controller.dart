import 'package:flutter/material.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/common/net/net_manager.dart';
import 'package:yyba_app/utils/app_util.dart';
import 'package:yyba_app/utils/toast_util.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController verityCodeController = TextEditingController();

  bool codeIsSending = false;
  bool codeInputOver = false;
  bool isVerityCode = true;
  String verityCode = '';
  String inputCode = '';

  Map<String, dynamic> pageArgs = {'phone': ''};

  initPage(args) {
    pageArgs = Map<String, dynamic>.from(args);
    notifyListeners();
  }

  sendCode() async {
    codeIsSending = true;
    var res = await netClient?.sendSms(pageArgs['phone']!,
        pageArgs['area']!.toString().substring(1), 'fastlogin');
    verityCode = res['data'];
    notifyListeners();
  }

  sendOverCode() {
    codeIsSending = false;
    notifyListeners();
  }

  codeInputChange(String val) {
    if (val.length == 4) {
      codeIsSending = false;
      codeInputOver = true;
      inputCode = val;
      notifyListeners();
    }
  }

  login() async {
    if (inputCode != verityCode) {
      isVerityCode = false;
      notifyListeners();
      return;
    }
    isVerityCode = true;
    notifyListeners();

    var deviceInfo = await getDeviceDetails();
    var res = await netClient?.login(
        pageArgs['phone']!,
        pageArgs['area']!.toString().substring(1),
        inputCode.toString(),
        deviceInfo['deviceType'].toString());

    netManager.setToken(res['token']);

    showToast('登陆成功！');

    RouterCtrl.popTo(PAGE_HOME);
  }
}
