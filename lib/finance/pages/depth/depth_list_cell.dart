import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepthListCell extends StatelessWidget {
  final ArticleModel model;
  final VoidCallback onPressed;

  DepthListCell({Key key, this.model, this.onPressed});
  final titleStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
  final subStyle = TextStyle(color: Colors.white30, fontSize: 12);
  final markStyle = TextStyle(color: Color.fromARGB(255, 255, 230, 169), fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 7.7, 15, 7.5),
        // color: Color.fromARGB(255, 27, 29, 36),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
            color: Color.fromARGB(255, 27, 29, 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  // child: Image.asset("imgs/688.jpg", width: 130, height: 82),
                  child: CachedNetworkImage(
                    imageUrl: model.firstPic ?? "",
                    width: ScreenUtil().screenWidth - 34,
                    height: 182,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                    errorWidget: (context, url, _) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                    ),
                ),
                Text(model.title, maxLines:2, style: titleStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Row(children: <Widget>[
                      Text(model.platformName ?? "", style: subStyle,),
                      SizedBox(width: 20,),
                      Text(model.authorName ?? "", style: subStyle),
                    ],),
                    Text("深度好文", style: markStyle)
                  ]
                )
              ],
            ),
          ),
        ),
        height: 310,),
    );
  }
}