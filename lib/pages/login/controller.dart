import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/area_phone_code.dart';
import 'package:yyba_app/utils/check_val.dart';
import 'package:yyba_app/utils/toast_util.dart';

class ViewCtrl with ChangeNotifier {
  TextEditingController areaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<dynamic> areaCodeList = areaPhoneCode;
  String areaCode = '+86';

  bool phoneError = false;

  areaCodeChange(int index) {
    log(index.toString());
    var newList = areaPhoneCode.where(((element) {
      return '${element['code']}${element['city']}'
          .contains(areaController.text);
    })).toList();
    areaCode = newList[index]['code']!;
    notifyListeners();
  }

  loginNext() {
    if (!isPhone(phoneController.text)) {
      phoneError = true;
      notifyListeners();
      return;
    } else {
      notifyListeners();
      phoneError = false;
    }

    RouterCtrl.push(
      PAGE_VERIFY_CODE,
      args: {'phone': phoneController.text, 'area': areaCode},
    );
  }
}
