import 'package:flutter/material.dart';
import 'package:flutter_study/beginner/utils/translation.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("init state my ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("dispose my ");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build my ");
    return Scaffold(
      appBar: AppBar(title: Text(Translations.of(context).text("my"))),
      body: Container(
        child: Text("my")
      ),
    );
  }
}