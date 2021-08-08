import 'dart:developer';

import 'package:yyba_app/common/net/net_manager.dart';
import 'package:yyba_app/model/res_type.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';

class ViewCtrl extends ViewController {
  List<ResType> resTypes = [];

  @override
  initPage(args) async {
    super.initPage(args);

    List res = await netClient?.resourceType();
    resTypes = res.map((e) => ResType.fromJson(e)).toList().sublist(0, 8);

    log('message: $resTypes');

    notifyListeners();
  }
}
