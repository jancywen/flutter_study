
import 'package:flutter/material.dart';
import 'package:flutter_study/finance/widgets/info_tab_bar_widget.dart';
import 'dart:math' as math;

var titleList = ['推荐', '快讯', '名人专栏', 'Defi'];

List<Widget> tabList;

class InfoHome extends StatefulWidget {
  @override
  _InfoHomeState createState() => _InfoHomeState();
}

TabController _tabController;

class _InfoHomeState extends State<InfoHome> with SingleTickerProviderStateMixin {


  var _tabBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabBar = InfoHomePageTabBar();
    tabList = getTabList();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  List<Widget> getTabList() {
    return titleList
    .map((e) => Text(
      "$e", 
      // style: TextStyle(fontSize: 20)
      )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 12, 14, 18),
      child: SafeArea(
        child: DefaultTabController(
          length: titleList.length, 
          child: _getNestedScrollView(_tabBar)),)
    );
  }
}

Widget _getNestedScrollView(Widget tabBar) {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget> [
        SliverPersistentHeader(
          floating: true,
          pinned: true,
          delegate: _SliverAppBarDelegate(
            maxHeight: 72.0,
            minHeight: 72.0,
            child: Container(
              height: 72.0,
              color: Color.fromARGB(255, 12, 14, 18), 
              child: tabBar,
            )
          ))
      ];
    }, 
    body: InfoTabBarView(
      tabController: _tabController
      ));
}
 
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  _SliverAppBarDelegate({this.minHeight, this.maxHeight, this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight || 
      child != oldDelegate.child;
  }
}
 
class InfoHomePageTabBar extends StatefulWidget {
   @override
   _InfoHomePageTabBarState createState() => _InfoHomePageTabBarState();
 }
 
class _InfoHomePageTabBarState extends State<InfoHomePageTabBar> {
  
  Color _selectedColor, _unselectedColor, _indicatorColor;
  TextStyle _selectedStyle, _unselectedStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedColor = Colors.white;
    _unselectedColor = Color.fromARGB(255, 143, 144, 146);
    _indicatorColor = Color.fromARGB(255, 255, 211, 99);
    _selectedStyle = TextStyle(fontSize: 22, color: _selectedColor);
    _unselectedStyle = TextStyle(fontSize: 16, color: _unselectedColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: tabList, 
        isScrollable: true, 
        controller: _tabController,
        indicatorColor: _indicatorColor,
        labelColor: _selectedColor,
        labelStyle: _selectedStyle,
        unselectedLabelColor: _unselectedColor,
        unselectedLabelStyle: _unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
 }