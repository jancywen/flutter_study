import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FlashListCell extends StatelessWidget {

  final ArticleModel model;
  final VoidCallback onPressed;

  FlashListCell({Key key, this.model, this.onPressed});

  final markStyle = TextStyle(color: Colors.white24, fontSize: 12,);
  final titleStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  final contentStyle = TextStyle(color: Colors.white30, fontSize: 16, );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0), 
                  child: Container(width: 8.0, height: 8.0, color: Color.fromARGB(255, 255, 211, 99),),
                  ),
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(9.0), 
                  child: Container(
                    // width: 52.0, 
                    height: 18.0, 
                    child: Center(child: Text(model.releaseTime ?? "", style: markStyle,),),),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:23,top:13, bottom:5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Text(model.title ?? "", style: titleStyle, maxLines: 2,),
                  ClipRect(
                    child:Text(model.content ?? "", style: contentStyle, maxLines: 5,),
                  )
                  
                ]
              )
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 23, top: 5, bottom: 5),
            //   child: Text(model.content ?? "", style: contentStyle, maxLines: 5,),
            //   )
          ],
        )
      )
    );
  }
}