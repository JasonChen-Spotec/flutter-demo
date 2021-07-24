import 'dart:developer';

import 'package:flutter/material.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController verityCodeController = TextEditingController();

  bool codeIsSending = false;
  bool codeInputOver = false;
  bool verityCode = true;

  String phone = '';

  initPage(args) {
    phone = args['phone'];
    log(args.toString());
    notifyListeners();
  }

  sendCode() {
    codeIsSending = true;
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
