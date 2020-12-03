import 'package:flutter/material.dart';
import 'package:flutter_study/finance/pages/info/index.dart';

class InfoTabBarView extends StatelessWidget {

  final TabController tabController;

  InfoTabBarView({Key key, @required this.tabController}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    var viewList = [RecommendPage(), FlashPage(), CelebrityPage(), DefiPage()];
    return TabBarView(
      children: viewList, 
      controller: tabController,);
  }
}


class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page1"),
    );
  }
}