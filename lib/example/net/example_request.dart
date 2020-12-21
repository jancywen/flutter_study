import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

/*
 * response.data
 {
   int code;
   String msg;
   String data;
 }
 */

Future exsmpleGet() async {

  return Future.delayed(Duration(seconds: 2), (){
    return exampleRequest();
  });
  
}

Future exampleRequest() async {
  return rootBundle.loadString('data/example.json').then((value) {
    debugPrint(value);
    return value;
  });
}