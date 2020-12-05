

import 'package:flutter/material.dart';


class SettingItem {
  String icon, title;
  SettingItem({this.icon, this.title});
}

class SettingItemWidget extends StatelessWidget {

  final SettingItem item;
  SettingItemWidget({Key key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:12, right: 13),
      height: 56,
      child: 
      Row(
        children:[
          Image.asset(item.icon, height: 28, width: 28),
          SizedBox(width: 5),
          Expanded(child: Text(item.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),)),
          Image.asset("imgs/indicator_gray.png", height: 13, width: 8),
        ],
      ),
    );
  }
}