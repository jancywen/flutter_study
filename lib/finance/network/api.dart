
import 'package:flutter/foundation.dart';

const String DEV_BASE_URL = "http://47.112.254.78:8090";
const String BASE_URL = "https://www.here.club";


class API {
  // 推荐 头部
  static const String recommend_header_path = "/here/v1/home";
  // 推荐 列表
  static const String recommend_list = "/here/v1/home/paging";
  // 快讯
  static const String flash_list_path = "/here/v1/news-flash";
  // 名人专栏
  static const String celebrity_list_path = "/here/v1/start-article";
  // DeFi
  static const String defi_list_path = "/here/v1/defi";
  // 深度
  static const String depth_list_path = "/here/v1/depth";

  // 发送验证码
  static const String send_code_path = "/here/v1/user/sendSmsCode";
  // 注册
  static const String register_path = "/here/v1/user/register";
  // 登录
  static const String login_path = "/here/v1/user/login";
  // 退出
  static const String logout_path = "";
  // 获取用户信息
  static const String user_info_path = "/here/v1/user/getUserInfo";
  // 获取入驻信息
  static const String settled_status_path = "/here/v1/user/enterInfo";
  // 入驻
  static const String settled_commit_path = "/here/v1/user/enter";



}

String formatUrl(String path) {
  // 断言
  var baseUrl = BASE_URL;
  assert((){
    baseUrl = DEV_BASE_URL;
    return true;
    }());
  return baseUrl + path;
  // 编译常数
  // return kReleaseMode ? BASE_URL + path : DEV_BASE_URL +path;
}
