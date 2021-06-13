import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/carousel/swiper_builder.dart';

class Carousel extends StatelessWidget {
  final List<dynamic> carouseList;
  final Function(BuildContext, int)? itemBuilder;
  final Function(int)? tapHandle;
  final double borderRadius;
  Carousel(this.carouseList,
      {this.itemBuilder, this.tapHandle, this.borderRadius = .0});
  @override
  Widget build(BuildContext context) {
    var unIcon = Container(
      decoration: BoxDecoration(
          color: Color(0xfffbfbfb).withOpacity(0.19),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.only(right: 5),
      width: Pt.pt3,
      height: Pt.pt3,
    );

    var icon = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.only(right: 5),
      width: Pt.pt15,
      height: Pt.pt3,
    );

    return Container(
      width: Pt.pt343,
      height: Pt.pt98,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(borderRadius)),
      alignment: Alignment.topCenter,
      child: Swiper(
        autoplayDelay: 1000 * 10,
        outer: false,
        itemBuilder: (BuildContext context, int index) {
          if (itemBuilder != null) {
            return itemBuilder!(context, index);
          }
          return Container();
        },
        layout: SwiperLayout.DEFAULT,
        itemCount: carouseList.length,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: Pt.pt10, right: 10),
            builder: SwiperBuilder(activeW: icon, normalW: unIcon, space: 50)),
        control: SwiperControl(
          iconPrevious: null,
          iconNext: null,
        ),
        onTap: (index) {
          this.tapHandle!(index);
        },
        autoplay: carouseList.length > 0,
      ),
    );
  }
}
