

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'enterprise_apply_page.dart';
import 'personal_apply_page.dart';


class ApplyPage extends StatefulWidget {
  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0c0e12),
      // appBar: _appBar(),
      body: Stack(
      children: [
        Positioned(top: 0,
          child: Image.asset("imgs/apply/apply_header.png", height: 194, fit: BoxFit.cover,width: ScreenUtil().screenWidth,)),
        Positioned(
          top: 20,
          child: Container(
            height: 44,
            width: ScreenUtil().screenWidth,
            child: Row(
              children: <Widget>[
                FlatButton(
                  height: 44,
                  minWidth: 40,
                  onPressed: () => Navigator.pop(context), 
                  child: Image.asset("imgs/nav_back.png", height: 20,)),
                Expanded(
                  child: Text(
                    "平台发文申请", 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                SizedBox(width: 40)
              ],
            ),)

        ),
        Positioned.fill(top: 194, child: Container(color: Color(0xff0c0e12),)),
        Positioned.fill(
          top: 0,
          child: DefaultTabController(
            length: 2, 
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  // SliverToBoxAdapter(
                  //   child: SizedBox(height:100),
                  // ),
                  SliverAppBar(
                    expandedHeight: 160.0,
                    pinned: true,

                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: ApplyItemsSliverPersistentHeader(tabController: _tabController)
                  )
                ];
              },
              body: ApplyTabBarView(tabController: _tabController,)
              ))
          // CustomScrollView(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: SizedBox(height: 105)
          //     ),
          //     SliverPersistentHeader(
          //       pinned: true,
          //       delegate: ApplyItemsSliverPersistentHeader(tabController: _tabController)
          //     ),
          //     // SliverToBoxAdapter(
          //     //   child: ApplyTabBarView(tabController: _tabController,)
          //     // )
          //   ],
          // ),
        ),
      ],
    )
  );
  }


@override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
}


class ApplyItemsSliverPersistentHeader extends SliverPersistentHeaderDelegate {

final TabController tabController;
ApplyItemsSliverPersistentHeader({Key key, @required this.tabController});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return Container(
      // color: Color(0xff0c0e12),
      decoration: BoxDecoration(
        color: Color(0xff0c0e12),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
      height: 90,
      child: Container(
        padding: EdgeInsets.only(left:15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ApplyTabItem(
              bgImage: tabController.index == 0 ? 
                "imgs/apply/apply_personal_selected.png" : 
                "imgs/apply/apply_personal_unselected.png", 
              title: "个人",
              onTap: () {
                tabController.index = 0;
              },),
            ApplyTabItem(
              bgImage: tabController.index == 1 ? 
                "imgs/apply/apply_enterprise_selected.png" : 
                "imgs/apply/apply_enterprise_unselected.png", 
              title: "企业",
              onTap: () {
                tabController.index = 1;
              },),
          ]
        ),
        ),
      );

  }

  @override
  double get maxExtent => 90;
 
  @override
  double get minExtent => 90;
 
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}


class ApplyTabItem extends StatelessWidget {

  final String bgImage;
  final String title;
  final VoidCallback onTap;

  ApplyTabItem({Key key, this.bgImage, this.title, this.onTap}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (ScreenUtil().screenWidth - 40 )/2,
      height: 42,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(bgImage)),
            Positioned.fill(child: Text(title, textAlign: TextAlign.center,))
          ],),
        ),
    );
  }
}


class ApplyTabBarView extends StatelessWidget {

  final TabController tabController;

  ApplyTabBarView({Key key, @required this.tabController}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    var viewList = [PersonalApplyPage(), EnterpriseApplyPage(),];
    return TabBarView(
      children: viewList, 
      controller: tabController,);
  }
}



