import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_study/finance/util/h5_api_util.dart';

class CommunityHome extends StatefulWidget {
  @override
  _CommunityHomeState createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment:Alignment.center,
        children: [
          WebView(
        initialUrl: H5_BASE_URL + H5API.community_path,
        javascriptMode: JavascriptMode.unrestricted,
        ),
        Positioned(
          top: 34,
          child: Text("Here社区", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
        )
        ],),
      );
  }
}