
import 'package:flutter_study/finance/models/index.dart';
import 'package:flutter_study/finance/util/image_util.dart';
import 'package:flutter/material.dart';



class InfoHeaderWidget extends StatelessWidget {

  final UserInfo user;
  InfoHeaderWidget({Key key, this.user});


  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.only(top:18, bottom: 40),
              height: 110,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: HereImage(url: user.avatar, placeholder: "imgs/avatar.png",height:52, width: 52)
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${user.nickname}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        Text("${user.iphone}")
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:15),
                    child: Image.asset("imgs/indicator.png",width: 8, height: 13),)
                ],
              ),
            );

  }
}