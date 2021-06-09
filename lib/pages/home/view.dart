import 'package:demo_app/pages/dynamic/view.dart';
import 'package:demo_app/pages/message/view.dart';
import 'package:demo_app/pages/mine/view.dart';
import 'package:demo_app/pages/resource/view.dart';
import 'package:demo_app/static/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  __HomePageState createState() => __HomePageState();
}

class __HomePageState extends State<_HomePage> {
  var itemList = [
    _BottomItemModel(
        title: '资源',
        icon: AssetsSvg.IC_ZIYUAN,
        selectIcon: AssetsSvg.IC_ZIYUAN,
        page: ResourcePage()),
    _BottomItemModel(
        title: '动态',
        icon: AssetsSvg.IC_DONGTAI,
        selectIcon: AssetsSvg.IC_DONGTAI,
        page: DynamicPage()),
    _BottomItemModel(
        title: '信息',
        icon: AssetsSvg.IC_XINXI,
        selectIcon: AssetsSvg.IC_XINXI,
        page: MessagePage()),
    _BottomItemModel(
        title: '我的',
        icon: AssetsSvg.IC_WODE,
        selectIcon: AssetsSvg.IC_WODE,
        page: MinePage()),
  ];

  @override
  Widget build(BuildContext context) {
    ViewCtrl _viewProvider = Provider.of<ViewCtrl>(context);
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: IndexedStack(
            children:
                List.generate(itemList.length, (index) => itemList[index].page),
            index: _viewProvider.tabIndex,
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _viewProvider.tabIndex,
        items: List.generate(itemList.length, (index) {
          return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                itemList[index].icon,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
              activeIcon: SvgPicture.asset(
                itemList[index].selectIcon,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
              label: itemList[index].title);
        }),
        onTap: (index) {
          _viewProvider.changeTab(index);
        },
      ),
    );
  }
}

class _BottomItemModel {
  String title;
  String icon;
  String selectIcon;
  Widget page;
  _BottomItemModel({
    required this.title,
    required this.icon,
    required this.selectIcon,
    required this.page,
  });
}
