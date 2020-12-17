import 'package:flutter/material.dart';
import 'index.dart';

class PrimaryMainPage extends StatefulWidget {
  @override
  _PrimaryMainPageState createState() => _PrimaryMainPageState();
}

class _PrimaryMainPageState extends State<PrimaryMainPage> {

  int _selectedIndex = 0;
  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  PageController _pageController;

  final itemNames = [
    _Item('资讯', 'imgs/icons/ic_home_x_zixun@2x.png', 'imgs/icons/ic_home_zixun@2x.png'),
    _Item('行情', 'imgs/icons/ic_home_x_hangqing@2x.png', 'imgs/icons/ic_home_hangqing@2x.png'),
    _Item('深度', 'imgs/icons/ic_home_x_shendu@2x.png', 'imgs/icons/ic_home_shendu@2x.png'),
    _Item('我的', 'imgs/icons/ic_home_x_wode@2x.png', 'imgs/icons/ic_home_wode@2x.png'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // PageView 跳转到指定页面
    // _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: ElasticInOutCurve());
    _pageController.jumpToPage(index);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        if (itemList == null) {
      itemList = itemNames
        .map((item) => BottomNavigationBarItem(
          icon: Image.asset(
            item.normalIcon, 
            width:23.0, 
            height: 23.0), 
          activeIcon: Image.asset(
            item.activeIcon, 
            width:23.0, 
            height: 23.0), 
          label: item.name)
        ).toList();
    }

    if (pages == null) {
      pages = [
        ShopPage(),
        CategoryPage(),
        CartPage(),
        MyPage(),
      ];
    }

    _pageController = PageController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      // body:_sotBodyPage()
      // body: pages[_selectedIndex],
      // body: _indexStackBodyPage()
      body: _pageViewBodyPage(),
    );
  }

  _bottomBar() {
  return BottomNavigationBar(
        items: itemList,
        currentIndex: _selectedIndex,
        iconSize: 20,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        unselectedItemColor: Color.fromARGB(255, 114, 114, 114),
        fixedColor: Color.fromARGB(255, 249, 244, 247),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 27, 29, 36),
      );
  }
/*
/// Stack + OffStage + TickerMode
  Widget _sotBodyPage() {
    return Stack(
      children: <Widget> [
        _buildPage(0),
        _buildPage(1),
        _buildPage(2),
        _buildPage(3),
      ]
    );
  }

  Widget _buildPage(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index, 
        child: pages[index]
        ),
    );
  }
*/
/*
/// IndexedStack
  Widget _indexStackBodyPage() {
    return IndexedStack(
      index: _selectedIndex,
      children: pages,
      );
  }
*/
// /*
/// pageview
  Widget _pageViewBodyPage() {
    return PageView(
      controller: _pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(), //禁止滑动
    );
  }
  // */
///
///

}




class _Item {
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}
