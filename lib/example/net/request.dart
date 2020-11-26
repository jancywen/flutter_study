import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_study/example/net/api.dart';
import 'package:flutter_study/example/net/result.dart';

import 'system_toast.dart';
import 'result_obj.dart';
import 'response_code.dart';


String formatUrl(String path) {
  return BASE_URL + path;
}

Future get(path, {dynamic data}) {
  return request(path, data: data, method: "GET");
}

Future post(path, {dynamic data}) {
  return request(path, data: data, method: "POST");
}


Future request(path, {dynamic data, String method}) async {
  try {
    Response response;
    Dio dio = Dio();
    response = await dio.request(
      formatUrl(path),
      data: data,
      options: Options(
        method: method ?? "GET", 
        headers: {},
        responseType: ResponseType.json,
        responseDecoder: (List<int> responseBytes, RequestOptions options,
         ResponseBody responseBody){
           Utf8Decoder utf8decoder = new Utf8Decoder();
           return utf8decoder.convert(responseBytes);
         })
    );

    if (response.statusCode == 200 && response.data != null) {
      Result result = ResultObj.fromat(response.data);
      switch (result.code) {
        case ResponseCode.successCode:
        return result.data;
        break;
        default:
        break;
      }
      SystemToast.show(result.msg);
    }else {
      print("加载失败");
    }

  } on DioError catch (e) {
    print("${e.error.toString()}");
    SystemToast.show(e.error.toString());
  }
}

