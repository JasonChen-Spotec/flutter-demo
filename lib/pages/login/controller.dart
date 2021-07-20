import 'package:flutter/material.dart';
import 'package:yyba_app/static/area_phone_code.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController areaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<dynamic> areaCodeList = areaPhoneCode;

  areaCodeChange(String str) {}
}
