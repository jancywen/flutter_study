import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'result.dart';
import 'system_toast.dart';
import 'result_obj.dart';
import 'response_code.dart';

import 'package:flutter_study/finance/util/crypto_util.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future get(path, {dynamic data}) {
  var signParam = getSignParam(data);
  var url = getJointUrl(formatUrl(path), signParam);
  return request(url, data: signParam, method: "GET");
}

Future post(path, {dynamic data}) {
  return request(formatUrl(path), data: getSignParam(data), method: "POST");
}


Future request(url, {dynamic data, String method}) async {
  // var url = formatUrl(path);
  debugPrint("url: $url");
  debugPrint("参数：$data");

  SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("TOKEN");

  try {
    Response response;
    Dio dio = Dio();
    response = await dio.request(
      url,
      data: data,
      options: Options(
        method: method ?? "GET", 
        headers: {"language": "ZH", "token": token ?? ""},
        responseType: ResponseType.json,
        responseDecoder: (List<int> responseBytes, RequestOptions options,
         ResponseBody responseBody){
           Utf8Decoder utf8decoder = new Utf8Decoder();
           return utf8decoder.convert(responseBytes);
         })
    );

    debugPrint(response.data.toString());

    if (response.statusCode == 200 && response.data != null) {

      Result result = ResultObj.fromat(response.data);
      switch (result.code) {
        case ResponseCode.successCode:
        return result.data;
        break;
        default:
        SystemToast.show(result.msg);
        return null;
        
        break;
      }      
    }else {
      debugPrint("加载失败");
    }

  } on DioError catch (e) {
    debugPrint("${e.error.toString()}");
    SystemToast.show(e.error.toString());
  }
}

