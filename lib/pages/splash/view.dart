import 'package:provider/provider.dart';
import 'package:yyba_app/common/config/config.dart';
import 'package:yyba_app/common/local_router/jump_router.dart';
import 'package:yyba_app/common/local_router/router_map.dart';
import 'package:yyba_app/static/img.dart';
import 'package:yyba_app/utils/screen.dart';
import 'package:yyba_app/widgets/common/count_timer_builder.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewCtrl>.value(
      value: ViewCtrl(),
      child: _Splash(),
    );
  }
}

class _Splash extends StatefulWidget {
  const _Splash({Key? key}) : super(key: key);

  @override
  __SplashState createState() => __SplashState();
}

class __SplashState extends State<_Splash> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<ViewCtrl>(context, listen: false).initPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: screen.screenWidth,
            height: screen.screenHeight,
            child: Image.asset(
              AssetsImg.MINE_BG,
              fit: BoxFit.fitHeight,
            ),
          ),

          /// 跳过
          CountTimer(
            1,
            timerBuilder: (context,
                {String? day,
                String? hour,
                String? minute,
                String? second,
                int? time}) {
              return Positioned(
                right: 30,
                top: 30,
                child: GestureDetector(
                  onTap: () {
                    RouterCtrl.replace(PAGE_HOME);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(time! <= 0 ? '跳过' : '${time.toString()}s'),
                  ),
                ),
              );
            },
          ),

          // 版本
          Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              "V${Config.innerVersion}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 8,
                  decoration: TextDecoration.none),
            ),
          ),
          // 预加载三角背景图
        ],
      ),
    );
  }
}
