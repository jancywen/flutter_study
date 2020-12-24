
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:flutter_study/finance/network/request_service.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  // 用户信息
  UserInfo _user;
  // token
  String _token;
  // 入驻状态  状态:1 未入驻  2申请中 3成功入驻 4拒绝
  int _settledStatus;


  UserInfo get user => _user;
  String get token => _token;
  int get settledStatus => _settledStatus;
  Function get saveToken => _saveToken;
  Function get getUserInfo => _getUserInfo;
  Function get getSettledStatus => _getSettledStatus;
  Function get clearData => _clearData;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  UserProvider(){
    _readToken();
    _readUserInfo();
    _readSettledStatus();
    // _getUserInfo();
  }


  // 读取token
  void _readToken() async {
    SharedPreferences prefs = await _prefs;
    _token = prefs.getString("TOKEN");
    if (_token != null) {
      _getUserInfo();
    }
  }
  // 保存token 
  void _saveToken(String token) async {
    _token = token;
    SharedPreferences prefs = await _prefs;
    prefs.setString("TOKEN", token);
  }
  // 读取用户信息
  void _readUserInfo() async {
    SharedPreferences prefs = await _prefs;
    String userJsonString = prefs.getString("USER_INFO");
    _user = UserInfo.fromJson(jsonDecode(userJsonString));
  }
  // 保存用户信息
  void _saveUserInfo(UserInfo user) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString("USER_INFO", user.toJson().toString());
  }
  // 读取入驻状态
  void _readSettledStatus() async {
    SharedPreferences prefs = await _prefs;
    _settledStatus = prefs.getInt("SETTLED_STATUS");
  }
  //保存入驻状态
  void _saveSettledStatus(int status) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt("SETTLED_STATUS", status);
  }

  // 退出
  void _clearData() async {
    _token = null;
    _user = null;
    _settledStatus = null;
    SharedPreferences prefs = await _prefs;
    prefs.remove("TOKEN");
    prefs.remove("USER_INFO");
    prefs.remove("SETTLED_STATUS");
    notifyListeners();
  }

  // 用户信息
  void _getUserInfo() async {
    if (_token == null) {return;}
    await userInfoQuery({})
    .then((value) {
      if (value != null) {
        _user = value;
        _saveUserInfo(value);
        notifyListeners();
      }
    }); 
  }
  // 入驻状态
  void _getSettledStatus() async {
    if (_token == null) {return;}
    await settledStatusQuery({})
    .then((value) {
      if (value["applicationStatus"] != null) {
        _settledStatus = value["applicationStatus"];
        _saveSettledStatus(value["applicationStatus"]);
        notifyListeners();
      }
    });
  }

}