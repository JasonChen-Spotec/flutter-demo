import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yyba_app/common/config/config.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/static/app_colors.dart';
import 'package:yyba_app/static/area_phone_code.dart';
import 'package:yyba_app/static/svg.dart';
import 'package:yyba_app/utils/pt.dart';
import 'package:yyba_app/widgets/btns/login_btn.dart';

import 'controller.dart';

showPicker(
  ViewCtrl viewProvider,
) {
  var _itemStrList = viewProvider.areaCodeList.map((e) {
    return '${e['city']}${e['code']}';
  });

  int _selectedIndex = viewProvider.areaCodeList.indexWhere((element) {
    return '${element['code']}'.contains(viewProvider.areaCode);
  });

  searchCodeChange(String str, subSet) {
    var newList = areaPhoneCode.where(((element) {
      return '${element['code']}${element['city']}'.contains(str);
    })).toList();
    log(newList.toString());

    subSet(() {
      _itemStrList = newList.map((e) {
        return '${e['city']}${e['code']}';
      });
    });
  }

  showModalBottomSheet(
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (_, subSet) {
          Picker picker = Picker(
              adapter:
                  PickerDataAdapter<String>(pickerdata: _itemStrList.toList()),
              itemExtent: Pt.pt46,
              height: Pt.pt310,
              selecteds: [_selectedIndex],
              onSelect: (_, int index, List<int> indexList) {
                _selectedIndex = indexList[0];
              },
              headerColor: Colors.white,
              textStyle: TextStyle(
                  fontSize: Pt.pt20, color: AppColors.primaryTextColor),
              columnPadding: EdgeInsets.symmetric(vertical: Pt.pt10),
              diameterRatio: 1.6,
              hideHeader: true,
              headerDecoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.white)),
              changeToFirst: true,
              selectionOverlay: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color(0xff030919).withOpacity(0.1)),
                        top: BorderSide(
                            width: 1,
                            color: Color(0xff030919).withOpacity(0.1)))),
              ));
          return Container(
            height: Pt.pt426,
            padding: EdgeInsets.only(top: Pt.pt20),
            child: Column(
              children: [
                Container(
                  width: Pt.pt320,
                  height: Pt.pt32,
                  padding: EdgeInsets.only(left: Pt.pt12),
                  decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.all(Radius.circular(Pt.pt32))),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        color: AppColors.primaryTextColor.withOpacity(0.3)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsSvg.IC_SOUSUO),
                        // SizedBox(width: Pt.pt10),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: Pt.pt32,
                            child: TextField(
                              style: TextStyle(fontSize: Pt.pt14),
                              // keyboardType: TextInputType.numberWithOptions(),
                              controller: viewProvider.areaController,
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String str) {
                                searchCodeChange(str, subSet);
                              },
                              decoration: InputDecoration(
                                hintText: '请输入国家名或国家编码',
                                hintStyle: TextStyle(
                                  color: AppColors.primaryTextColor
                                      .withOpacity(0.3),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                picker.makePicker(),
                LoginBtn(
                  '确认选择',
                  height: Pt.pt40,
                  onTap: () {
                    viewProvider.areaCodeChange(_selectedIndex);
                    viewProvider.areaController.value =
                        TextEditingValue(text: '');
                    RouterCtrl.pop();
                  },
                )
              ],
            ),
          );
        });
      },
      elevation: 0,
      context: Config.appContext);
}
