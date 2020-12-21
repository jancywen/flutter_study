import 'package:flutter/material.dart';
import 'package:flutter_study/novice/routes/index.dart';
import 'app_config.dart';

main() {
  var configuredApp = AppConfig(
    appName: "dev", 
    apiBaseUrl: "http://dev.xxxx.com", 
    child: MyApp());
  runApp(configuredApp);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return MaterialApp(
      title: config.appName,
      home: HomeRoute(),
    );
  }
}


class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName)
      ),
      body: Center(
        child: Text(config.apiBaseUrl)
      ),
    );
  }
}