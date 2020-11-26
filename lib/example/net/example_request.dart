import 'package:flutter/services.dart';

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
    print(value);
    return value;
  });
}