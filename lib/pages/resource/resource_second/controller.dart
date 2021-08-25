import 'dart:math';

import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/common/net/net_manager.dart';
import 'package:yyba_app/model/res_type.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';

class ViewCtrl extends ViewController {
  /// 二级资源类型
  List<ResType> resTypes = [];

  @override
  initPage(args) async {
    super.initPage(args);
    List res = await netClient?.resourceType(parentId: args['id']);
    resTypes = res
        .map((e) => ResType.fromJson(e))
        .toList()
        .sublist(0, [res.length, 8].reduce(min));

    // List recommendRes = await netClient?.homeResRecommend();
    notifyListeners();
  }

  toThirdPage(ResType res) {
    RouterCtrl.push(PAGE_RESOURCE_THIRD, args: {
      'type_l1_id': pageArgs['id'],
      'type_l2_id': res.id,
      'name': res.name
    });
  }
}
