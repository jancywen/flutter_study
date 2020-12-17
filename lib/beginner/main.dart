
import 'package:flutter_study/beginner/utils/translation.dart';
import 'package:flutter_study/beginner/utils/global.dart';

import 'primary_main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _localeOverrideDelegate = new SpecificLocalizationDelegate(Global.locale);
    applic.onLocaleChanged = onLocaleChange;
  }

  // 改变语言时的应用刷新核心方法：
  onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
    Global.saveLanguageCode(locale.languageCode);
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [

        // 注册一个新的delegate
        _localeOverrideDelegate, 
 
        // 指向默认的处理翻译逻辑的库 
        const TranslationsDelegate(), 
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ],
      supportedLocales: applic.supportedLocales(),
      home: PrimaryMainPage(),
    );
  }
}