import 'package:flutter/material.dart';

import 'example_request.dart';
import 'package:flutter_study/example/models/index.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


Future exampleQuery(data) {
  return exsmpleGet().then((data) {    
    ExampleSimpleModel model = ExampleSimpleModel.fromJson(json.decode(data.toString()));
    return model;
  });
}

Future exampleHomeQuery() {
  return rootBundle.loadString('data/example_home.json').then((value) {
    debugPrint(value);
    ExampleHomeModel model = ExampleHomeModel.fromJson(json.decode(value.toString()));
    return model;
  });
}