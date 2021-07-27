import 'package:flutter/material.dart';
import 'package:yyba_app/common/config/address.dart';
import 'package:yyba_app/common/net/net_manager.dart';

class ViewCtrl with ChangeNotifier {
  initPage() {
    netManager.init(Address.baseApiPath);
  }
}
