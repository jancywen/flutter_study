import 'package:flutter/material.dart';
import 'package:flutter_study/beginner/utils/translation.dart';


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
    debugPrint("init state shop ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("dispose shop ");
  }
  @override
  Widget build(BuildContext context) {

    debugPrint("build shop");
    
    return Scaffold(
      appBar: AppBar(title: Text(Translations.of(context).text("shop"))),
      body: Container(
        child: Column(
          children: [
            FlatButton(
              onPressed: (){
                applic.onLocaleChanged(new Locale('en'));
              }, 
              child: Text("Englist")
            ),
            FlatButton(
              onPressed: (){
                applic.onLocaleChanged(new Locale('zh'));
              }, 
              child: Text("简体中文")
            )
          ],
        )
      ),
    );
  }
}