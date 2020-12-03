
import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerItem extends StatelessWidget {

  final BannerModel model;

  BannerItem({Key key, this.model}): super(key: key);

  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
        child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // child: Image.asset("imgs/688.jpg", width: 130, height: 82),
              child: CachedNetworkImage(
                imageUrl: model.url ?? "",
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                errorWidget: (context, url, _) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                ),
            ),
      );
  }
}