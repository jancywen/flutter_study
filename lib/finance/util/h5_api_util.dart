import 'package:flutter/foundation.dart';

const String H5_BASE_URL = "https://www.here.club/here-h5/#";
const String H5_DEV_URL = "http://47.112.254.78:8081/here_h5/#";
class H5API {
  // 详情
  static const String info_detail_path = "/inforDetails";
  // 社区
  static const String community_path = "/community?language=ZH";
}


String formatH5Url(String path, String id) {
  return (kReleaseMode ? H5_BASE_URL : H5_DEV_URL) + path + "?language=ZH&id=" + id;
}