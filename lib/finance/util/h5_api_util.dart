const String H5_BASE_URL = "http://47.112.254.78:5000/#";

class H5API {
  // 详情
  static const String info_detail_path = "/inforDetails";
}


String formatH5Url(String path, String id) {
  return H5_BASE_URL + path + "?language=ZH&id=" + id;
}