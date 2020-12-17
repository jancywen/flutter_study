import 'package:flutter/material.dart';

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
    print("init state my ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose my ");
  }

  @override
  Widget build(BuildContext context) {
    print("build my ");
    return Scaffold(
      appBar: AppBar(title: Text("my")),
      body: Container(
        child: Text("my")
      ),
    );
  }
}