
import 'package:flutter/foundation.dart';

import 'api.dart';
import 'request.dart';
import 'dart:convert';

import 'package:flutter_study/finance/models/index.dart';


// 推荐顶部
Future<RecommendHeaderModel> recommendHeaderQuery(data) {
  return get(API.recommend_header_path, data: data)
  .then((data) => RecommendHeaderModel.fromJson(data));
}
// 推荐列表
Future<ArticleListModel> recommendListQuery(data) {
  return get(API.recommend_list, data: data)
    .then((data) => ArticleListModel.fromJson(data));
}

// 快讯
Future<ArticleListModel> flashListQuery(data) {
  return get(API.flash_list_path, data: data)
    .then((data) => ArticleListModel.fromJson(data));
}

// 名人专栏
Future<ArticleListModel> celebrityListQuery(data) {
  return get(API.celebrity_list_path, data: data)
    .then((data) => ArticleListModel.fromJson(data));
}

// DeFi
Future<ArticleListModel> defiListQuery(data) {
  return get(API.defi_list_path, data: data)
    .then((data) => ArticleListModel.fromJson(data));
}

// 深度
Future<ArticleListModel> depthListQuery(data) {
  return get(API.depth_list_path, data: data)
    .then((data) => ArticleListModel.fromJson(data));
}

// 注册
Future registerQuery(data) {
  return post(API.register_path, data:data);
}

// 登录
Future loginQuery(data) {
  return post(API.login_path, data: data);
}

// 发送短信
Future sendVerificationCode(data) {
  return post(API.send_code_path, data: data);
}
  // 获取用户信息
Future userInfoQuery(data) {
  return get(API.user_info_path, data: data)
  .then((value) => UserInfo.fromJson(value));
}
  // 获取入驻信息
Future settledStatusQuery(data) {
  return get(API.settled_status_path, data: data);
}
  // 入驻
Future settledAction(data) {
  return post(API.settled_commit_path, data: data).then((value) => debugPrint(value));
}
