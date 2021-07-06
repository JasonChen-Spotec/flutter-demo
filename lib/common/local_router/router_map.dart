import 'package:yyba_app/pages/home/view.dart';
import 'package:yyba_app/pages/resource/resource_second/view.dart';
import 'package:yyba_app/pages/resource/resource_third/view.dart';
import 'package:yyba_app/pages/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:yyba_app/pages/video_resource/view.dart';

///启动页
const PAGE_SPLASH = "splash";

///home
const PAGE_HOME = "home";

///资源二级页面
const PAGE_RESOURCE_SECOND = "resource_second";

///资源三级页面
const PAGE_RESOURCE_THIRD = "resource_third";

///视频播放页
const PAGE_VIDEO_RESOURCE = "video_resource";

Map<String, WidgetBuilder> routerMap = <String, WidgetBuilder>{
  PAGE_SPLASH: (_) => Splash(),
  PAGE_HOME: (_) => HomePage(),
  PAGE_RESOURCE_SECOND: (_) => ResourceSecondPage(),
  PAGE_RESOURCE_THIRD: (_) => ResourceThirdPage(),
  PAGE_VIDEO_RESOURCE: (_) => VideoResource(),
};
