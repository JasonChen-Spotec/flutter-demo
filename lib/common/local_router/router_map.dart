import 'package:yyba_app/pages/home/view.dart';
import 'package:yyba_app/pages/resource/resource_second/view.dart';
import 'package:yyba_app/pages/resource/resource_third/view.dart';
import 'package:yyba_app/pages/splash/view.dart';
import 'package:flutter/material.dart';

///启动页
const PAGE_SPLASH = "splash";

///home
const PAGE_HOME = "home";

///资源二级页面
const PAGE_RESOURCE_SECOND = "resource_second";

///资源三级页面
const PAGE_RESOURCE_THIRD = "resource_third";

Map<String, WidgetBuilder> routerMap = <String, WidgetBuilder>{
  PAGE_SPLASH: (_) => Splash(),
  PAGE_HOME: (_) => HomePage(),
  PAGE_RESOURCE_SECOND: (_) => ResourceSecondPage(),
  PAGE_RESOURCE_THIRD: (_) => ResourceThirdPage(),
};
