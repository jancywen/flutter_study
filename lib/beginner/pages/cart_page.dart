import 'package:flutter/material.dart';
import 'package:flutter_study/beginner/utils/translation.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state cart ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose cart ");
  }
  @override
  Widget build(BuildContext context) {
    print("build cart");
    return Scaffold(
      appBar: AppBar(title: Text(Translations.of(context).text("cart"))),
      body: Container(
        child: Text("cart")
      ),
    );
  }
}