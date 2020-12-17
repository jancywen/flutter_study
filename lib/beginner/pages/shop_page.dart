import 'package:flutter/material.dart';


class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state shop ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose shop ");
  }
  @override
  Widget build(BuildContext context) {

    print("build shop");
    
    return Scaffold(
      appBar: AppBar(title: Text("shop")),
      body: Container(
        child:Text("shop")
      ),
    );
  }
}