import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yyba_app/common/net/net_manager.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController verityCodeController = TextEditingController();

  bool codeIsSending = false;
  bool codeInputOver = false;
  bool isVerityCode = true;
  String verityCode = '';
  String inputCode = '';

  Map<String, dynamic> pageArgs = {'phone': ''};

  initPage(args) {
    pageArgs = new Map<String, dynamic>.from(args);
    notifyListeners();
  }

  sendCode() async {
    codeIsSending = true;
    var res = await netClient?.sendSms(
        pageArgs['phone']!, pageArgs['area']!, 'fastlogin');
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
    var res = await netClient?.login(
        pageArgs['phone']!, pageArgs['area']!, inputCode);
  }
}
