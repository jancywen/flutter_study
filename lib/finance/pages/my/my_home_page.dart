import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:flutter_study/finance/providers/index.dart';
import 'info_header_widget.dart';
import 'setting_item_widget.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff0c0e12),
      body: Consumer<UserProvider>(builder: (context, userProvider, child){
        return 
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xffFFD363),
              expandedHeight: 160.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(child: Image.asset("imgs/my_info_header.png", fit: BoxFit.fill,)),
                    Positioned(
                      bottom: 40,
                      child: Container(
                        height: 52,
                        width: ScreenUtil().screenWidth,
                        // color: Colors.red,
                        child: InfoHeaderWidget(
                          user: userProvider.user, 
                          tapHeader: (){
                            if (userProvider.user == null) {
                              Navigator.pushNamed(context, "/login_page");
                            }else {
                              Navigator.pushNamed(context, "/personal_info");
                            }
                          },),
                      ),
                      )
                  ],
                )
              ),
              shadowColor: Color(0xff)
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: BlackSliverPersistentHeader()
            )
          ];
        },
        body: ListView(children: _getWidgetList(userProvider, context),)
      );
      },)
    );
  }

  List<Widget> _getWidgetList(UserProvider userProvider, BuildContext context) {
    var list = [
      [
        MyHomeItemType.notification,
        MyHomeItemType.language,
        MyHomeItemType.opinion
      ], 
      [
        MyHomeItemType.about, 
        MyHomeItemType.secert,
      ]
    ];
    list.insert(0, userProvider.settledStatus == 3 ? [MyHomeItemType.manage] : [MyHomeItemType.enter]);
    if (userProvider.user != null) {
      list.add([MyHomeItemType.logout]);
    }
  return list.map<Widget>(
    (e) => SettingSectionWidget(
      settingList: e, 
      onPressedItem:(item) => 
        _onPressedItem(context,userProvider, item),)).toList();
  }

  void _onPressedItem(BuildContext context, UserProvider userProvider, MyHomeItemType item) {
    
    debugPrint(item.toString());

    switch (item) {
      case MyHomeItemType.enter:
        if(userProvider.token == null) {
          Navigator.pushNamed(context, "/login_page");
        }else {
          if (userProvider.settledStatus == null || userProvider.settledStatus == 1) {
            Navigator.pushNamed(context, "/apply_page");
          }else {
            Navigator.pushNamed(context, "/apply_result");
          }
        }
        break;
      case MyHomeItemType.manage:

        break;
      case MyHomeItemType.notification:

        break;
      case MyHomeItemType.language:

        break;
      case MyHomeItemType.opinion:

        break;
      case MyHomeItemType.about:

        break;
      case MyHomeItemType.secert:

        break;
      case MyHomeItemType.logout:
        showDialog(context: context, builder: (BuildContext context){
          return CupertinoAlertDialog(
            title:Text("提示"),
            content: Text("确定退出吗？"),
            actions: [
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                ),
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () { 
                  Navigator.of(context).pop();
                  userProvider.clearData();
                },
                ),
              ],
          );
        });
        break;
      default:
        break;
    }
  }
}

class BlackSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return Stack(children: [
      Positioned(
        child: Container(
          color: Color.fromARGB(255, 249, 216, 139),
          height:20,
        )
      ),
      Positioned(
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xff0c0e12),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
          ),
        )
      )
    ],
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

