import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;

class CustomScrollTabBarView extends StatefulWidget {
  final List<String> tabs;
  final Widget Function(BuildContext, int) tabViewBuilder;
  final Widget? otherChild;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomScrollTabBarView(
      {Key? key,
      required this.tabs,
      required this.tabViewBuilder,
      this.otherChild,
      this.backgroundColor = AppColors.backgroundColor,
      this.padding})
      : super(key: key);

  @override
  _CustomScrollTabBarViewState createState() => _CustomScrollTabBarViewState();
}

class _CustomScrollTabBarViewState extends State<CustomScrollTabBarView>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: extended.NestedScrollView(
        innerScrollPositionKeyBuilder: () {
          int index = tabController.index;
          var key = "tab$index";
          return Key(key);
        },
        headerSliverBuilder: (BuildContext context, bool? innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: widget.otherChild),
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              primary: false,
              toolbarHeight: 0,
              backgroundColor: widget.backgroundColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Pt.pt35),
                child: Container(
                  padding: widget.padding,
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabs: widget.tabs.map((e) => Text(e)).toList(),
                    labelStyle: TextStyle(
                      fontSize: Pt.pt14,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: Pt.pt14,
                    ),
                    labelColor: AppColors.primaryTextColor,
                    labelPadding: EdgeInsets.only(
                        bottom: Pt.pt2, right: Pt.pt10, left: Pt.pt10),
                    indicator: MaterialIndicator(
                        height: 2,
                        horizontalPadding: 10,
                        color: AppColors.active),
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(widget.tabs.length, (index) {
            return Scrollbar(child: widget.tabViewBuilder(context, index));
          }),
        ),
      ),
    );
  }
}
