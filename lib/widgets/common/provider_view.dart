import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ViewController extends ChangeNotifier {
  Map<String, dynamic> pageArgs = {};

  initPage(args) {
    pageArgs = new Map<String, dynamic>.from(args);
    notifyListeners();
  }
}

abstract class ProviderView<T extends ViewController> extends StatefulWidget {
  final T controller;
  ProviderView({Key? key, required this.controller}) : super(key: key);
}

abstract class ProviderViewState<T extends ProviderView> extends State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
}

mixin BaseControllerMixin<T extends ProviderView> on ProviderViewState<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      var arg = ModalRoute.of(context)!.settings.arguments;
      widget.controller.initPage(arg ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
