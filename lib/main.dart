
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    "/product_detail": (context) => ProductDetail(),
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
          visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: _routeList,
        initialRoute: "/home_index",
        onGenerateRoute: _onGenerateRoute,
        onUnknownRoute: _onUnknownRoute,
      ));
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
      case 2:
        return ExamplePage1();
      default:
        return ErrorPage();
    }
  }

  @override
  Widget build(BuildContext context) {

    // 屏幕适配
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);

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

