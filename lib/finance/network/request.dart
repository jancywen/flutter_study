import 'dart:convert';

import 'package:dio/dio.dart';
import 'api.dart';
import 'result.dart';
import 'system_toast.dart';
import 'result_obj.dart';
import 'response_code.dart';

import 'package:flutter_study/finance/util/crypto_util.dart';

String formatUrl(String path) {
  return BASE_URL + path;
}

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
  print("url: $url");
  print("参数：$data");

  try {
    Response response;
    Dio dio = Dio();
    response = await dio.request(
      url,
      data: data,
      options: Options(
        method: method ?? "GET", 
        headers: {"language": "ZH"},
        responseType: ResponseType.json,
        responseDecoder: (List<int> responseBytes, RequestOptions options,
         ResponseBody responseBody){
           Utf8Decoder utf8decoder = new Utf8Decoder();
           return utf8decoder.convert(responseBytes);
         })
    );

    print(response.data);

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
      print("加载失败");
    }

  } on DioError catch (e) {
    print("${e.error.toString()}");
    SystemToast.show(e.error.toString());
  }
}

