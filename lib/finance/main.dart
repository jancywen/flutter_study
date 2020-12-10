import 'package:flutter/material.dart';

import 'index.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _routeList = {
    "/finance_home": (context) => FinanceHomePage(),
  };

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    print("routeName: $routeName");
    if (_routeList.containsKey(routeName)) {
      var f = _routeList[routeName];
      return MaterialPageRoute(builder: f);
    }
    return null;
  }

  Route<dynamic> _onUnknownRoute(RouteSettings settings) {
    String name = settings.name;
    print("未匹配到路由：$name");
    return MaterialPageRoute(builder: _routeList["/error_page"]);
  }
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title:"flutter demo",
        theme: ThemeData(
          // brightness: Brightness.dark,
          
          primarySwatch: Colors.blue, 
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor:  Color(0xff0c0e12),
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white, fontSize: 16), 
            headline2: TextStyle(color: Colors.white30, fontSize: 12),
            ),
          ),
        routes: _routeList,
        initialRoute: "/finance_home",
        onGenerateRoute: _onGenerateRoute,
        onUnknownRoute: _onUnknownRoute,
      ));
  }
}
