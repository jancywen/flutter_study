import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class HereImage extends StatelessWidget {

  final String url;
  final String placeholder;
  final double width,height;

  HereImage({Key key, this.url, this.placeholder, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => Image.asset(placeholder ?? "imgs/placeholder.png", ),
      errorWidget: (context, url, _) => Image.asset(placeholder ?? "imgs/placeholder.png",),
      );
  }
}