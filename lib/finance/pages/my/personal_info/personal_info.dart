import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/index.dart';
import 'package:flutter_study/finance/util/image_util.dart';


class PersonalInfo extends StatelessWidget {


final titleStyle = TextStyle(fontSize: 14, color: Color(0xfff9f7f4), fontWeight: FontWeight.w400);
final subStyle = TextStyle(fontSize: 14, color: Color(0xff8f9092), fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 12, 14, 18),
        ),
      backgroundColor: Color.fromARGB(255, 12, 14, 18),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child){
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
                    color: Color(0xff1b1d24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Text("头像",style: titleStyle,),
                        Row(
                          children:<Widget> [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Expanded(
                                child: HereImage(
                                  url: userProvider.user.avatar ?? "", 
                                  placeholder: "imgs/avatar.png",
                                  height:30, 
                                  width: 30,)
                                ),
                            ),
                            SizedBox(width: 7),
                            Image.asset("imgs/indicator_gray.png", height: 13, width: 8,)
                          ]
                        )
                      ]
                    ),
                  ),
                ),
                ),

              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
                    color: Color(0xff1b1d24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Text("头像",style: titleStyle,),
                        Row(
                          children:<Widget> [
                            Text(userProvider.user.nickname ?? "", style:subStyle),
                            SizedBox(width: 7),
                            Image.asset("imgs/indicator_gray.png", height: 13, width: 8,)
                          ]
                        )
                      ]
                    ),

                  ),
                ),
                ),
              
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
                    color: Color(0xff1b1d24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Text("昵称",style: titleStyle,),
                        Row(
                          children:<Widget> [
                            Text(userProvider.user.mobile ?? "", style:subStyle),
                            SizedBox(width: 15),
                            // Image.asset("imgs/indicator_gray.png", height: 13, width: 8,)
                          ]
                        )
                      ]
                    ),

                  ),
                ),
                ),
              
            ],
          );
        },),
    );
  }
}