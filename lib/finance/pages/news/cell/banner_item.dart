
import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_study/finance/util/image_util.dart';

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
              child: HereImage(url: model.url ?? ""),
            ),
      );
  }
}