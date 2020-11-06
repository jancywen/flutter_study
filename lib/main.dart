import 'package:flutter/material.dart';
import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _routeList = {
    "/home_index": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
    "/error_page": (context) => ErrorPage(),
    "/geek_home": (context) => HomePage(),
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: _routeList,
      initialRoute: "/home_index",
      onGenerateRoute: _onGenerateRoute,
      onUnknownRoute: _onUnknownRoute,
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getRoutePage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return SortPage();
      default:
        return ErrorPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
          BottomNavigationBarItem(icon: Icon(Icons.sort), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '购物车'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: '我的')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        iconSize: 20,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      body: getRoutePage()
    );
  }
}

