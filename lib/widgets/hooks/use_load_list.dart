import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadListHookRes<R> {
  void Function()? onRefresh;
  void Function()? onLoading;
  bool? isLoading;
  List resList = [];
  LoadListHookRes();
}

LoadListHookRes useLoadList(
    BuildContext context, Function(dynamic args) getList) {
  ValueNotifier result = useState([]);
  ValueNotifier<bool> isLoading = useState<bool>(false);

  Map<String, dynamic> defaultParams = {'page': 1, 'pageNumber': 10};

  Future _getList(dynamic args) async {
    isLoading.value = true;
    var res = await getList(defaultParams);
    isLoading.value = false;
    result.value = res;
  }

  useEffect(() {
    _getList(defaultParams);
  }, []);

  onRefresh() {
    defaultParams['page'] = 1;
    _getList(defaultParams);
  }

  onLoading() {
    defaultParams['page'] += 1;
    _getList(defaultParams);
  }

  return LoadListHookRes()
    ..onLoading = onLoading()
    ..onRefresh = onRefresh()
    ..isLoading = isLoading.value
    ..resList = result.value;
}
