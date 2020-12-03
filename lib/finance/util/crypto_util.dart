import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'dart:convert';

String getSign(Map parameters) {
  // 秘钥
  var key = "秘钥";
  // var parameters = data as Map<String, dynamic>;

  List<String> allKeys = [];
  
  parameters.forEach((key, value) {
    allKeys.add(key + "=" + value.toString());
  });

  allKeys.sort((obj1,obj2) => obj1.compareTo(obj2));
  
  String pairString = allKeys.join("&");
  String sign = pairString.isEmpty ? key : pairString  + "&" + key;

  String signString = generateMd5(sign).toUpperCase();
  return signString;
}

  /// md5加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}

Map getSignParam(Map param) {

  var signParam = new Map();

  param.forEach((key, value) {
    signParam[key] = value;
  });
  var sign = getSign(param);
  signParam['sign'] = sign;

  return signParam;
}


String getJointUrl(String url, Map param) {
  // var signParam = getSignParam(param);

  List<String> allKeys = [];
  param.forEach((key, value) {
    allKeys.add(key + "=" + value.toString());
  });
  var paramStr = allKeys.join("&");

  return url + "?" + paramStr;

}