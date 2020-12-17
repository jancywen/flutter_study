

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              title: Text(
                "平台发文申请", 
                style: TextStyle(
                  color: Color(0xff0c0e12),
                  fontSize: 16, 
                  fontWeight: FontWeight.bold),),
                  iconTheme: IconThemeData(color: Color(0xff0c0e12)),
                  backgroundColor: Color(0xffFFD363),
                  expandedHeight: 160.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("imgs/apply/apply_header.png", fit: BoxFit.fill,)
                  ),
                  shadowColor: Color(0xff)
                ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ApplyItemsSliverPersistentHeader(tabController: _tabController)
            )
          ];
        },
        body: ApplyTabBarView(tabController: _tabController,)
      ),
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
    
    return Stack(children: [
      Positioned(
        child: Container(
          height: 90,
          color: Color(0xffffd363),
        )
      ),
      Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
        color: Color(0xff0c0e12),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
      height: 90,
      child: Container(
        padding: EdgeInsets.only(left:15, right: 15),
        child: 
        ItemSwitchBar(onTapItem: (int index){tabController.index = index;},)
        ),
      )
        )
    ],);

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


class ItemSwitchBar extends StatefulWidget {

  final Function(int a) onTapItem;

  ItemSwitchBar({Key key, this.onTapItem});

  @override
  _ItemSwitchBarState createState() => _ItemSwitchBarState();
}

class _ItemSwitchBarState extends State<ItemSwitchBar> {

  int selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ApplyTabItem(
              bgImage: selectedIndex == 0 ? 
                "imgs/apply/apply_personal_selected.png" : 
                "imgs/apply/apply_personal_unselected.png", 
              title: "个人",
              textStyle: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w400, 
                color: selectedIndex == 0 
                  ? Color(0xff0c0e12)
                  : Color(0xfff9f7f4)),
              onTap: () {
                if (selectedIndex != 0) {
                  setState(() {
                    selectedIndex = 0;
                  });
                  widget.onTapItem(0);
                }
                
              },),
            ApplyTabItem(
              bgImage: selectedIndex == 1 ? 
                "imgs/apply/apply_enterprise_selected.png" : 
                "imgs/apply/apply_enterprise_unselected.png", 
              title: "企业",
              textStyle: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w400, 
                color: selectedIndex == 1 
                  ? Color(0xff0c0e12)
                  : Color(0xfff9f7f4)),
              onTap: () {
                if (selectedIndex != 1) {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.onTapItem(1);
                }
              },),
          ]
        );
  }
}


class ApplyTabItem extends StatelessWidget {

  final String bgImage;
  final String title;
  final TextStyle textStyle;
  final VoidCallback onTap;

  ApplyTabItem({Key key, this.bgImage, this.title,this.textStyle, this.onTap}); 

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
            Positioned.fill(child: Center(child: Text(title, textAlign: TextAlign.center, style: textStyle)))
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
      controller: tabController,
      physics: NeverScrollableScrollPhysics(),
      );
  }
}



