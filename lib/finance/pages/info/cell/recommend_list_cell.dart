import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_study/finance/util/image_util.dart';

class RecommendListCell extends StatelessWidget {

  final ArticleModel model;
  final VoidCallback onPressed;
  RecommendListCell({Key key, this.model, this.onPressed}) : super(key: key);

  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onPressed,
      child:Container(
        // height: 82,
        padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
        child: Row(
          children: <Widget> [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(model.title ?? "", maxLines: 2, style: titleStyle,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Text(model.platformName ?? "", style: subTitleStyle),
                      SizedBox(width: 20),
                      Text(model.formateTime(), style: subTitleStyle)
                    ]
                  )
                ],
              )
            ,),
            SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: HereImage(url: model.firstPic ?? "", width: 130, height: 82,),
            )
          ]
        )
      )
    );
  }
}