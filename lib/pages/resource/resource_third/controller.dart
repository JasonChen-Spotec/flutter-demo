import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yyba_app/common/net/net_manager.dart';
import 'package:yyba_app/model/res.dart';
import 'package:yyba_app/widgets/common/provider_view.dart';

class ViewCtrl extends ViewController {
  RefreshController refreshController = RefreshController(initialRefresh: true);

  List<String> tabList = ['综合', 'VIP', '时间', '价格'];

  ///资源列表
  List<Res> resList = [];

  ///
  String currentTag = '综合';

  onTabChange(int index) {
    currentTag = tabList[index];
  }

  getList(args) async {
    var _list = await netClient?.resRecommend(
        tags: [currentTag],
        l1Id: pageArgs['type_l1_id'],
        l2Id: pageArgs['type_l2_id']);
    List recommendList = _list['rows'];
    resList = recommendList.map((e) => Res.fromJson(e)).toList();
    // notifyListeners()
  }

  // onRefresh(int index) {
  //   getList({});
  // }

  // onLoading(int index) {}
}
