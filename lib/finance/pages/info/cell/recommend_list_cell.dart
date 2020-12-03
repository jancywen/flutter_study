import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        height: 82,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Text(model.platformName ?? "", style: subTitleStyle),
                      Text(model.releaseTime ?? "", style: subTitleStyle)
                    ]
                  )
                ],
              )
            ,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // child: Image.asset("imgs/688.jpg", width: 130, height: 82),
              child: CachedNetworkImage(
                imageUrl: model.firstPic ?? "",
                width: 130,
                height: 82,
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                errorWidget: (context, url, _) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                ),
            )
          ]
        )
      )
    );
  }
}