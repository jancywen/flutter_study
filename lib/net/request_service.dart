import 'api.dart';
import 'request.dart';
import 'package:flutter_study/models/index.dart';
import 'dart:convert';

Future<ExampleSubModel> subExampleQuery(data) {
  return get(API.path1, data: data)
    .then((data) => ExampleSubModel.fromJson(json.decode(data.toString())));
}