import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state category ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose category ");
  }
  @override
  Widget build(BuildContext context) {
    print("build category");
    return Scaffold(
      appBar: AppBar(title: Text("Sort")),
      body: Container(
        child: Text("sort")
      ),
    );
  }
}