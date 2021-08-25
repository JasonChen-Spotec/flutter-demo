import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

// class TestProvider<T extends ViewController> extends StatefulWidget {
//   final T controller;
//   final Widget child;
//   const TestProvider({Key? key, required this.controller, required this.child})
//       : super(key: key);

//   @override
//   _TestState createState() => _TestState<T>();
// }

// class _TestState<T> extends State<TestProvider> {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//       var arg = ModalRoute.of(context)!.settings.arguments;
//       widget.controller.initPage(arg ?? {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: widget.controller,
//       child: widget.child,
//     );
//   }
// }

abstract class ViewController extends ChangeNotifier {
  Map<String, dynamic> pageArgs = {};

  initPage(args) {
    pageArgs = Map<String, dynamic>.from(args);
    notifyListeners();
  }
}

abstract class ProviderView<T extends ViewController>
    extends StatefulHookWidget {
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
    return ChangeNotifierProvider<ViewController>.value(
      value: widget.controller,
      child: Builder(builder: (context) {
        Provider.of<ViewController>(context);
        return body(context);
      }),
    );
  }

  Widget body(BuildContext context);
}
