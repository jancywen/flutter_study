
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
  // 入驻状态
  int _settledStatus;


  UserInfo get user => _user;
  String get token => _token;
  int get settledStatus => _settledStatus;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  UserProvider(){
    _readToken();
    _readUserInfo();
    _readSettledStatus();
  }

  

  // 读取token
  void _readToken() async {
    SharedPreferences prefs = await _prefs;
    _token = prefs.getString("TOKEN");
  }
  // 保存token 
  void _saveToken(String token) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString("TOKEN", token);
  }

  void _readUserInfo() async {
    SharedPreferences prefs = await _prefs;
    String userJsonString = prefs.getString("USER_INFO");
    _user = UserInfo.fromJson(jsonDecode(userJsonString));
  }
  void _saveUserInfo(UserInfo user) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString("USER_INFO", user.toJson().toString());
  }

  void _readSettledStatus() async {
    SharedPreferences prefs = await _prefs;
    _settledStatus = prefs.getInt("SETTLED_STATUS");
  }
  void _saveSettledStatus(int status) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt("SETTLED_STATUS", status);
  }

  // 用户信息
  void _getUserInfo() async {
    await userInfoQuery({}).then((value) {}); 
  }
  // 入驻状态
  void _getSettledStatus() async {
    await settledStatusQuery({}).then((value) {});
  }

}