import 'package:flutter/material.dart';
import 'package:flutter_study/beginner/utils/translation.dart';

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
    debugPrint("init state category ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("dispose category ");
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("build category");
    return Scaffold(
      appBar: AppBar(title: Text(Translations.of(context).text("category"))),
      body: Container(
        child: Text("sort")
      ),
    );
  }
}