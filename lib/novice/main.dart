import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study/novice/routes/language_route.dart';
import 'package:flutter_study/novice/routes/login_route.dart';
import 'package:flutter_study/novice/routes/theme_change_route.dart';
import 'common/global.dart';
import 'package:provider/provider.dart';
import 'providers/profile_change_notifier.dart';
import 'routes/index.dart';
import 'common/gm_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../generated/l10n.dart';


main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((value) => runApp(MyApp()));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocalModel()),
      ],
      child: Consumer2<ThemeModel, LocalModel>(
        builder: (BuildContext context, themeModel, localeModel, child){
          return MaterialApp(
            theme: ThemeData(
              primaryColor: themeModel.theme
              ),
            // onGenerateTitle: (context){
            //   return S.of(context).title;
            // },
            home: HomeRoute(),
            locale: localeModel.getLocale(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              // GMLocalizationsDelegate(),
              S.delegate,
            ],
            localeResolutionCallback: 
              (Locale _locale, Iterable<Locale> supportedLocales){
                if (localeModel.getLocale() != null) {
                  return localeModel.getLocale();
                }
                else {
                  Locale locale;
                  if (supportedLocales.contains(_locale)) {
                    locale = _locale;
                  }else {
                    locale = Locale('en', 'US');
                  }
                  return locale;
                }
              },
            routes: <String, WidgetBuilder>{
              '/login': (context) => LoginRoute(),
              '/themes': (context) => ThemeChangeRoute(),
              '/language': (context) => LanguageRoute(),
            },
            builder: EasyLoading.init(),
          );
        },),
    );
  }
}