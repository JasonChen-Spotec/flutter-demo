import 'package:flutter/material.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController areaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool codeIsSending = false;
  bool codeSendOver = false;

  sendCode() {
    codeIsSending = true;
    notifyListeners();
  }

  sendOverCode() {
    codeSendOver = true;
    codeIsSending = false;
    notifyListeners();
  }

  sendCodeAgain() {
    codeSendOver = false;
    notifyListeners();
  }
}
