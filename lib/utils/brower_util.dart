import './toast_util.dart';
import './log.dart';
import 'package:url_launcher/url_launcher.dart';

/// 浏览器跳转
openBrowser(String url, {String tip = '出错了'}) async {
  try {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      showToast(tip);
    }
    return;
  } catch (e) {
    l.e("browser", "openBrowser()...error:$e");
  }
}

/// 从浏览器打开微信
openWxFromBrowser() async {
  String url = "weixin://";
  openBrowser(url, tip: '打开微信失败');
}
