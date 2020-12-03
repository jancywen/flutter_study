import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HotArticleCell extends StatelessWidget {
  final ArticleModel model;
  final VoidCallback onPressed;
  HotArticleCell({Key key, this.model, this.onPressed}) : super(key: key);


  final markStyle = TextStyle(color: Color.fromARGB(255, 255, 211, 99), fontSize: 12,fontWeight: FontWeight.bold);
  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: 



    ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child:Container(
      color: Color.fromARGB(255, 25, 29, 36),
      width: 222,
      height: 120,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("热门文章",style: markStyle),
            Text(model.title ?? "", style: titleStyle,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.platformName ?? "", style: subTitleStyle),
                Text(model.releaseTime ?? "", style: subTitleStyle)
              ],
            )
          ],
        ),
      ),
    ));
  }
}