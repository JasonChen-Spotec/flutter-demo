import 'package:yyba_app/pages/splash/view.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/log.dart';
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:provider/provider.dart';

import 'common/config/config.dart';
import 'common/provider/global_controller.dart';
import './common/local_router/router_map.dart';

class InitedApp extends StatefulWidget {
  InitedApp() : super();

  @override
  _InitedAppState createState() => _InitedAppState();
}

class _InitedAppState extends State<InitedApp>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final String tag = "AppLifeCycle";
  @override
  void initState() {
    super.initState();

    /// 添加activity生命周期监听函数
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        l.i(tag, "app 暂停了inactive");
        break;
      case AppLifecycleState.detached:
        l.i(tag, "app 暂停了detached");
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        l.i(tag, "app 恢复了resumed");
        break;
      case AppLifecycleState.paused:
        l.i(tag, "app 暂停了paused");
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GlobalController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Config.navigatorKey,
        theme: ThemeData(
          dialogTheme: DialogTheme(elevation: 0),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          splashColor: Colors.transparent,
          backgroundColor: AppColors.backgroundColor,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: AppColors.primaryTextColor),
          ),
        ),

        debugShowCheckedModeBanner: true,
        //关掉模拟器右上角debug图标
        home: Splash(),
        navigatorObservers: [CustomRouteObserver()],
        routes: routerMap,
        onGenerateRoute: (RouteSettings settings) {
          String? routeName = settings.name;
          if (routerMap[routeName] == null) {
            l.e('router error', '没有匹配到路由组件');
          }
        },
      ),
    );
  }
}

//继承RouteObserver
class CustomRouteObserver<PageRoute> extends RouteObserver {
  @override
  void didPop(Route route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
  }
}
