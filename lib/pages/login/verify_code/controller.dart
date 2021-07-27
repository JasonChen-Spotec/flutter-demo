import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yyba_app/common/net/net_manager.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController verityCodeController = TextEditingController();

  bool codeIsSending = false;
  bool codeInputOver = false;
  bool verityCode = true;

  Map<String, dynamic> pageArgs = {'phone': ''};

  initPage(args) {
    pageArgs = new Map<String, dynamic>.from(args);
    notifyListeners();
  }

  sendCode() async {
    codeIsSending = true;
    var sendSms2 = netClient?.sendSms;
    log(sendSms2.toString());
    var res = await netClient?.sendSms(
        pageArgs['phone']!, pageArgs['area']!, 'fastlogin');

    log(res.toString());
    notifyListeners();
  }

  sendOverCode() {
    codeIsSending = false;
    notifyListeners();
  }

  codeInputChange(String val) {
    if (val.length == 4) {
      codeInputOver = true;
      notifyListeners();
    }
  }

  login() {}
}
