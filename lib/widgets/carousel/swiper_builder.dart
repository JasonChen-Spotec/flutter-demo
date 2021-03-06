import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

/// 自定义 指示器
class SwiperBuilder extends SwiperPlugin {
  ///Size of the dot when activate
  final double activeSize;

  ///Size of the dot
  final double size;

  /// Space between dots
  final double space;

  final Widget? activeW;
  final Widget? normalW;

  const SwiperBuilder(
      {this.activeW,
      this.normalW,
      this.size = 10.0,
      this.activeSize = 10.0,
      this.space = 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of CustomSwiperPaginationBuilder in this sitituation");
    }

    Widget? activeW = this.activeW;
    Widget? normalW = this.normalW;

    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(
        Container(
          key: Key("pagination_$i"),
          child: active ? activeW : normalW,
        ),
      );
    }
    if (config.scrollDirection == Axis.vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}

typedef SwiperPaginationBuilder = Widget Function(
    BuildContext context, SwiperPluginConfig config);

class SwiperCustomPagination extends SwiperPlugin {
  final SwiperPaginationBuilder builder;

  SwiperCustomPagination({required this.builder});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return builder(context, config);
  }
}
