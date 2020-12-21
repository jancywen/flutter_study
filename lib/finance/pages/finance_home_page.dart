
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index.dart';

class FinanceHomePage extends StatefulWidget {
  @override
  _FinanceHomePageState createState() => _FinanceHomePageState();
}

class _FinanceHomePageState extends State<FinanceHomePage> {

  int _selectedIndex = 0;

  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  PageController _pageController;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('资讯', 'imgs/icons/ic_home_x_zixun@2x.png', 'imgs/icons/ic_home_zixun@2x.png'),
    _Item('行情', 'imgs/icons/ic_home_x_hangqing@2x.png', 'imgs/icons/ic_home_hangqing@2x.png'),
    _Item('深度', 'imgs/icons/ic_home_x_shendu@2x.png', 'imgs/icons/ic_home_shendu@2x.png'),
    _Item('社区', 'imgs/icons/ic_home_x_shequ@2x.png', 'imgs/icons/ic_home_shequ@2x.png'),
    _Item('我的', 'imgs/icons/ic_home_x_wode@2x.png', 'imgs/icons/ic_home_wode@2x.png'),
  ];


  @override
  void initState() {
    super.initState();

    if (pages == null) {
      pages = [
        InfoHome(),
        MarketHome(),
        DepthHome(),
        CommunityHome(),
        MyHome()
      ];
    }

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
    
    _pageController = PageController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index, 
        child: pages[index]),
    );
  }
  @override
  Widget build(BuildContext context) {
        // 屏幕适配
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);

    return Scaffold(
      bottomNavigationBar: _appBar(),
      body: _buildBody(),
    );
  }

  Widget _appBar() {
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

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(),
    );
  }

}

class _Item {
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}

