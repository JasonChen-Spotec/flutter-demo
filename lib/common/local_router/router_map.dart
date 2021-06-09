import 'package:demo_app/pages/home/view.dart';
import 'package:demo_app/pages/splash/view.dart';
import 'package:flutter/material.dart';

///启动页
const PAGE_SPLASH = "splash";

///home
const PAGE_HOME = "home";

Map<String, WidgetBuilder> routerMap = <String, WidgetBuilder>{
  PAGE_SPLASH: (_) => Splash(),
  PAGE_HOME: (_) => HomePage(),
};
