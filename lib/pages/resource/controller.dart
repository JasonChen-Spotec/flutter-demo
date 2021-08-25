import 'dart:developer';

import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/common/net/net_manager.dart';
import 'package:yyba_app/model/res.dart';
import 'package:yyba_app/model/res_type.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';

class ViewCtrl extends ViewController {
  /// 资源类型
  List<ResType> resTypes = [];

  ///推荐列表
  List<Res> resList = [];

  ///推荐tabs
  List<String> recommendTabs = ['热门', '科技', '数据', '运营', '教育'];

  @override
  initPage(args) async {
    super.initPage(args);
    log(pageArgs.toString());
    List res = await netClient?.resourceType();
    resTypes = res.map((e) => ResType.fromJson(e)).toList().sublist(0, 8);

    getRecommendRes(recommendTabs[0]);
  }

  getRecommendRes(String tag) async {
    var recommendRes = await netClient?.resRecommend(tags: [tag]);
    List recommendList = recommendRes['rows'];
    resList = recommendList.map((e) => Res.fromJson(e)).toList();

    notifyListeners();
  }

  onTabChange(int index) {
    var tag = recommendTabs[index];
    getRecommendRes(tag);
  }

  /// 跳转二级资源页面
  toSecondPage(ResType item) {
    RouterCtrl.push(PAGE_RESOURCE_SECOND,
        args: {'id': item.id, 'name': item.name});
  }
}
