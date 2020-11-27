
import 'api.dart';
import 'request.dart';
import 'dart:convert';

import 'package:flutter_study/finance/models/index.dart';



Future<RecommendHeaderModel> recommendHeaderQuery(data) {
  return get(API.recommend_header_path, data: data)
    .then((data) => RecommendHeaderModel.fromJson(json.decode(data.toString())));
}

Future<RecommendListModel> recommendListQuery(data) {
  return get(API.recommend_list, data: data)
    .then((data) => RecommendListModel.fromJson(json.decode(data.toString())));
}