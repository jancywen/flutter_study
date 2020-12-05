import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'info_header_widget.dart';
import 'setting_item_widget.dart';


class MyHome extends StatefulWidget {

  final user = UserInfo(id: "121", nickname: "大熊", iphone: "113774", avatar: "ssdld");

  final List<List<SettingItem>> _settingList  = [
      [
        SettingItem(
          icon: "imgs/setting/setting_manage.png", 
          title: "文章管理"),
      ],
      [
        SettingItem(
          icon: "imgs/setting/setting_notification.png", 
          title: "推送通知"),
        SettingItem(
          icon: "imgs/setting/setting_language.png", 
          title: "语言设置"),
        SettingItem(
          icon: "imgs/setting/setting_opinion.png", 
          title: "意见反馈"),
      ],
      [
        SettingItem(
          icon: "imgs/setting/setting_about.png", 
          title: "关于Here"),
        SettingItem(
          icon: "imgs/setting/setting_secert.png", 
          title: "修改密码"),
      ],
      [
        SettingItem(
          icon: "imgs/setting/setting_logout.png", 
          title: "退出登录"),
      ],
    ];

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 0,
          child: Image.asset("imgs/my_info_header.png", height: 194)),
        Positioned.fill(top: 194, child: Container(color: Color(0xff0c0e12),)),
        Positioned.fill(
          top: 64,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: InfoHeaderWidget(user: widget.user,)
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: BlackSliverPersistentHeader()
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                    return Container(
                      color: Color(0xff0c0e12),
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 15), 
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0), 
                        child: Container(
                          color: Color(0xff1b1d24),
                          child: Column(
                            children: widget._settingList[index].map((e) => SettingItemWidget(item: e,)).toList(),
                          ),
                          ),
                        ),
                      );
                  }, 
                  childCount: widget._settingList.length)
              )
            ],
          ),
        ),
      ],
    );
  }

  
}

class BlackSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return Container(
      // color: Color(0xff0c0e12),
      decoration: BoxDecoration(
        color: Color(0xff0c0e12),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
      height: 20,
      );

  }

  @override
  double get maxExtent => 20;
 
  @override
  double get minExtent => 20;
 
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}



