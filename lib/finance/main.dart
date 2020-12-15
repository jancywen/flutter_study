
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    print("routeName: $routeName");
    if (routeList.containsKey(routeName)) {
      var f = routeList[routeName];
      return MaterialPageRoute(builder: f);
    }
    return null;
  }

  Route<dynamic> _onUnknownRoute(RouteSettings settings) {
    String name = settings.name;
    print("未匹配到路由：$name");
    return MaterialPageRoute(builder: routeList["/error_page"]);
  }
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title:"flutter demo",
        theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.black,//(按钮)Widget前景色为黑色
          primarySwatch: Colors.blue, 
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor:  Color(0xff0c0e12), // 主色调
          iconTheme:IconThemeData(color: Colors.blue),//icon主题色为蓝色
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white, fontSize: 16), 
            headline2: TextStyle(color: Colors.white30, fontSize: 12),
            ),
          ),
        routes: routeList,
        initialRoute: "/finance_home",
        onGenerateRoute: _onGenerateRoute,
        onUnknownRoute: _onUnknownRoute,
      ));
  }
}
