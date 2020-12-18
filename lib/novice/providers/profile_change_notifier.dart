import 'package:flutter/material.dart';
import 'package:flutter_study/novice/models/index.dart';
import 'package:provider/provider.dart';
import '../common/global.dart';
import '../index.dart';
import 'package:intl/intl.dart';


class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

/// 用户状态
class UserModel extends ProfileChangeNotifier {
  User get user => _profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  // 更新用户信息
  set user(User user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}


// APP主题状态
class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => Global.themes.firstWhere((element) => element.value == _profile.theme, orElse:()=> Colors.orange);

  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}

/// APP语言状态
class LocalModel extends ProfileChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if(_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    Locale locale;
    if (t.length ==2) {
      locale = Locale(t[0], t[1]);
    }
    locale = Locale(t[0]);  
    // S.load(locale);
    // Intl.getCurrentLocale();
    return locale;
  }

  String get locale => _profile.locale;

  set locale(String localeStr) {
    if (localeStr != _profile.locale) {
      _profile.locale = localeStr;

      // if(_profile.locale == null) return null;
      Locale locale;
      if (localeStr == null) {
        locale = Locale('en');
      }else {
        var t = localeStr.split("_");
        if (t.length ==2) {
          locale = Locale(t[0], t[1]);
        }else {
          locale = Locale(t[0]); 
        }
      }
      S.load(locale);
      notifyListeners();
    }
  }
}