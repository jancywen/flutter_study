
import 'package:flutter_study/finance/models/index.dart';
import 'package:flutter_study/finance/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InfoHeaderWidget extends StatelessWidget {

  final UserInfo user;
  final VoidCallback tapHeader;
  InfoHeaderWidget({Key key, this.user, this.tapHeader});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: tapHeader,
      child: Container(
        child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: user == null 
                    ? Image.asset("imgs/avatar.png") 
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: HereImage(url: user.avatar ?? "", placeholder: "imgs/avatar.png",height:52, width: 52,)
                    )
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: user == null ? 
                        [
                          Text("点击登录", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                          Text("登录后享受更多功能")
                        ] : 
                        [
                          Text(user.nickname ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          Text(user.mobile ?? "")
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:15),
                    child: Image.asset("imgs/indicator.png",width: 8, height: 13),)
                    ,UnconstrainedBox()
                ],
              ),
            )
      );

  }
}