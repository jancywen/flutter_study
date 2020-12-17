import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CelebrityListCell extends StatelessWidget {
  final ArticleModel model;
  final VoidCallback onPressed;

  CelebrityListCell({Key key, this.model, this.onPressed});
  final titleStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
  final nicknameStyle = TextStyle(color: Colors.white30, fontSize: 12);
  final timeStyle = TextStyle(color: Colors.white30, fontSize: 12);
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CachedNetworkImage(
                          imageUrl: model.authorIcon ?? "",
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Image.asset("imgs/avatar.png",),
                          errorWidget: (context, url, _) => Image.asset("imgs/avatar.png",),
                        )
                      ),
                      SizedBox(width: 10,),
                      Text(model.authorName ?? "", style: nicknameStyle),
                    ],),
                    Text(model.releaseTime, style: timeStyle)
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