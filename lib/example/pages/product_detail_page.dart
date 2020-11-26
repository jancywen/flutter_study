import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

  //取出路由参数 
  String msg = ModalRoute.of(context).settings.arguments as String;
  print(msg);

    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("标题"),
            pinned:true,
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("添加");
                },
              ),
              new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: "price", child: new Text('Sort by price')),
                    new PopupMenuItem<String>(
                        value: "time", child: new Text('Sort by time')),
                  ],
              onSelected: (String action) {
                switch (action) {
                  case "price":
                    // do nothing
                    break;
                  case "time":
                    // do nothing
                    break;
                }
              },
              icon: Icon(Icons.shopping_basket),offset: Offset(0, 50),)
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text("商品详情"),
              background: Swiper(
                  itemBuilder: (BuildContext context, int index){
                    return Image.asset("imgs/688.jpg",fit: BoxFit.cover);
                  }, 
                  itemCount: 3,),
          ),
        ),

        SliverList(delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
              return  Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                  // height: 120,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        children:<TextSpan>[
                          TextSpan(text: "￥", style:TextStyle(fontSize: 14)),
                          TextSpan(text: "388.00", style:TextStyle(fontSize: 18))
                        ]
                      ), style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),

                      SizedBox(height: 5),

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "价格 "),
                            TextSpan(text: "￥733", style: TextStyle(decoration: TextDecoration.lineThrough))
                          ]
                        ),
                        style: TextStyle(color: Color(0xffb1b1b3)),
                      ),

                      SizedBox(height: 5),

                      Text("限时特惠 ｜ 极客时间 X 读库 联合学习礼盒", 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)

                    ],)
                )
              );
          }, childCount: 8,
        )),

        
      ],
    )
    );
  }
}