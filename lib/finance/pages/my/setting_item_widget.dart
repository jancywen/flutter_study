

import 'package:flutter/material.dart';


class SettingItem {
  String icon, title;
  SettingItem({this.icon, this.title});
}


enum MyHomeItemType {
  enter,
  manage, 
  notification,
  language,
  opinion,
  about,
  secert,
  logout,
}


class SettingSectionWidget extends StatelessWidget {
  final List<MyHomeItemType> settingList;
  final Function(MyHomeItemType type) onPressedItem;
  SettingSectionWidget({Key key, this.settingList, this.onPressedItem}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0c0e12),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0), 
        child: Container(
          child: Column(
            children: settingList.map((e) => SettingItemWidget(item: e, onPressedItem: onPressedItem,)).toList(),
          ),
        ),
      ),
    );
  }
}

class SettingItemWidget extends StatelessWidget {

  final MyHomeItemType item;
  final Function(MyHomeItemType type) onPressedItem;
  SettingItemWidget({Key key, this.item, this.onPressedItem});

  @override
  Widget build(BuildContext context) {

    var icon = "";
    var title = "";
    switch (item) {
      case MyHomeItemType.enter:
        icon = "imgs/setting/setting_enter.png";
        break;
      case MyHomeItemType.manage:
        icon = "imgs/setting/setting_manage.png";
        title = "文章管理";
        break;
      case MyHomeItemType.notification:
        icon = "imgs/setting/setting_notification.png";
        title = "推送通知";
        break;
      case MyHomeItemType.language:
        icon = "imgs/setting/setting_language.png";
        title = "语言设置";
        break;
      case MyHomeItemType.opinion:
        icon = "imgs/setting/setting_opinion.png";
        title = "意见反馈";
        break;
      case MyHomeItemType.about:
        icon = "imgs/setting/setting_about.png";
        title = "关于HERE";
        break;
      case MyHomeItemType.secert:
        icon = "imgs/setting/setting_secert.png";
        title = "修改密码";
        break;
      case MyHomeItemType.logout:
        icon = "imgs/setting/setting_logout.png";
        title = "退出登录";
        break;
      default:
        break;
    }

    return GestureDetector(
      onTap: () => onPressedItem(item),
      child: item == MyHomeItemType.enter ? 
      Container(
        height: 64,
        child: Image.asset(icon, fit: BoxFit.fill),
      )
      :
     Container(
      padding: EdgeInsets.only(left:12, right: 13),
      height: 56,
      color: Color(0xff1b1d24),
      child: 
      Row(
        children:[
          Image.asset(icon, height: 28, width: 28),
          SizedBox(width: 5),
          Expanded(child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),)),
          Image.asset("imgs/indicator_gray.png", height: 13, width: 8),
        ],
      ),
    ));
  }
}
