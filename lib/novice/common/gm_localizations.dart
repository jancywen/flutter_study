import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
/*
class GMLocalizations {

  GMLocalizations(this.isZh);

  bool isZh = false;

  static GMLocalizations of(BuildContext context) {
    return Localizations.of<GMLocalizations>(context, GMLocalizations);
  }

  String get title {
    return isZh ? "Flutter应用" : "Flutter app";
  }

  String get home {
    return isZh ? "GitHub客户端": "GitHub Client";
  }

  String get login {
    return isZh ? "登录": "Login";
  }

  String get noDescription {
    return isZh ? "主人很懒": "The master was lazy";
  }
  String get theme {
    return isZh ? "主题": "theme";
  }
  String get language {
    return isZh ? "语言": "language";
  }
  String get logout {
    return isZh ? "退出": "logout";
  }
  String get logoutTip {
    return isZh ? "确认登录": "are you sure logout?";
  }
  String get cancel {
    return isZh ? "取消": "cancel";
  }
  String get yes {
    return isZh ? "确定": "yes";
  }
  String get auto {
    return isZh ? "跟随系统": "Auto";
  }
  String get userName {
    return isZh ? "用户名": "Auto";
  }
    String get userNameOrEmail {
    return isZh ? "跟随系统": "Auto";
  }
    String get userNameRequired {
    return isZh ? "跟随系统": "Auto";
  }
    String get password {
    return isZh ? "密码": "Auto";
  }
    String get passwordRequired {
    return isZh ? "跟随系统": "Auto";
  }
    String get userNameOrPasswordWrong {
    return isZh ? "跟随系统": "Auto";
  }

}


class GMLocalizationsDelegate extends LocalizationsDelegate<GMLocalizations> {
  const GMLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<GMLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<GMLocalizations> (
      GMLocalizations(locale.languageCode == 'zh')
      );
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<GMLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}

*/