import 'example_request.dart';
import 'package:flutter_study/models/index.dart';
import 'dart:convert';

Future exampleQuery(data) {
  return exsmpleGet().then((data) {    
    ExampleSimpleModel model = ExampleSimpleModel.fromJson(json.decode(data.toString()));
    return model;
  });
}
