///地址数据
class Address {
  static const API_PREFIX = "api/app";

  ///M3U8视频加密字符
  static const SECRET_SUFFIX = "/media/enkey";

  static const H5_SUFFIX = "/h5/app";

  ///视频播放地址后缀
  static const VIDEO_SUFFIX = "/media/m3u8";

  /// 基本的path
  static String baseHost = '';

  /// 基本的path
  static String baseApiPath = '';

  ///h5地址
  static String h5Url = '';

  ///cdn地址，后台返回
  static String videoCdn = '';

  ///图片加载地址
  static String imgCdn = '';

  ///官网地址
  static String officeUrl = '';

  ///应用中心
  static String appCenter = '';

  ///通过支付宝API解析银行卡号发卡行和银行卡类别、获取银行LOGO
  static const ALI_CCD_API =
      "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardBinCheck=true&cardNo=";
}
