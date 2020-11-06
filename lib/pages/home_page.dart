import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    return Scaffold(
      // appBar: AppBar(title: Text("Geek Home"),),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            sliver: SliverList(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                  height: 35,
                  color: Color(0x08000000),
                  child: Center(
                    child:Text("限量发售 | 数字魔法礼盒", style: TextStyle(color: Colors.orange)),
                  ),
                )
                );
              }, childCount: 1
            )
            ),
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 1,
                child: Swiper(
                  indicatorAlignment: AlignmentDirectional.bottomCenter,
                  speed: 400,
                  circular: true,
                  indicator: CircleSwiperIndicator(),
                  children: <Widget>[
                    Image.asset("imgs/688.jpg", fit: BoxFit.cover),
                    Image.asset("imgs/688.jpg", fit: BoxFit.cover),
                    Image.asset("imgs/688.jpg", fit: BoxFit.cover),
                  ],
                ),
              );
            }, childCount: 1,
          )
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index){
              return Column(
                children:<Widget> [
                  Container(
                    height: 50,
                    color: Color(0x08000000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Text("自营商品满59元包邮",style: TextStyle(fontSize: 12),),
                        Text("原创 精选", style: TextStyle(fontSize: 12),),
                        Text("7天无忧退换货", style: TextStyle(fontSize: 12),),
                      ]
                    ),
                  ),
                  
                ]
              );
            }, childCount: 1
          )),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 180,
                  // color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: 
                          Image.asset("imgs/688.jpg", 
                          height: 40,
                          width: 40, 
                          fit: BoxFit.cover,
                          )
                      ),
                      SizedBox(height: 5),
                      Text("每周上新")
                    ],
                  )
                );
              }, childCount: 4,
            ), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1
            )
          ),),

          SliverPadding(
            padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
            sliver: SliverList(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 65,
                  color: Color(0x08000000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text("限时折扣", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold)),
                      Text("- TIME DISCOUNTS -", style: TextStyle(fontSize: 16))
                    ],
                  ),
                );
              }, childCount: 1
            )
            ),
          ),

          SliverList(delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index){
              return Container(
                height:30,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: <Widget>[
                      Text("限时折扣卡：")
                    ]
                  ),
                )
              );
            },childCount: 1,
          )),

          SliverPadding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 5), 
            sliver: SliverGrid(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(color:Color(0x22222222), offset: Offset(1, 1.5), blurRadius: 1, spreadRadius: 0.5)
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("imgs/688.jpg", height: 110, fit: BoxFit.cover,),
                      Padding(
                        padding: new EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Text("100元充值卡+Git 快捷口令鼠标兜售大促销", maxLines: 2, overflow:TextOverflow.ellipsis),
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(children:<TextSpan>[
                                TextSpan(text: "￥", style: TextStyle(fontSize: 12, color: Colors.orange)),
                                TextSpan(text: "189", style:TextStyle(color:Colors.orange, fontSize: 16)),
                              ])
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(children:<TextSpan>[
                                TextSpan(text: "￥", style: TextStyle(fontSize: 10)),
                                TextSpan(text: "189", style:TextStyle(fontSize: 13)),
                              ]),
                              style:TextStyle(color:Color(0x22000000), fontSize: 14, decoration: TextDecoration.lineThrough)
                            ),
                            // Text("￥234", style:TextStyle(color:Color(0x22000000), fontSize: 14, decoration: TextDecoration.lineThrough)),
                          ]
                        ) ,
                      ),
                    ],
                  ),
                  )
                );

              }, childCount: 3,
            ), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 0.5,          
            )
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            sliver: SliverList(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 65,
                  color: Color(0x08000000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text("精进学习", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold)),
                      Text("- DILIGENT LEARNING -", style: TextStyle(fontSize: 16))
                    ],
                  ),
                );
              }, childCount: 1
            )
            ),
          ),

          SliverPadding(padding: const EdgeInsets.fromLTRB(15, 5, 15, 5), 
            sliver: SliverGrid(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return Container(
                  // color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("imgs/688.jpg", height: 110, fit: BoxFit.cover,),
                      SizedBox(height: 5),
                      Text("100元充值卡+Git 快捷口令鼠标兜售大促销", maxLines: 2, overflow:TextOverflow.ellipsis),
                      SizedBox(height: 10),
                      Text.rich(
                              TextSpan(children:<TextSpan>[
                                TextSpan(text: "￥", style: TextStyle(fontSize: 12, color: Colors.orange)),
                                TextSpan(text: "189", style:TextStyle(color:Colors.orange, fontSize: 16)),
                              ])
                            ),
                    ],
                  )
                );
              }, childCount: 9,
            ), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 0.52,          
            )
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            sliver: SliverList(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 65,
                  color: Color(0x08000000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text("极客时间原创", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold)),
                      // Text("- DILIGENT LEARNING -", style: TextStyle(fontSize: 16))
                    ],
                  ),
                );
              }, childCount: 1
            )
            ),
          ),

          SliverPadding(padding: const EdgeInsets.fromLTRB(15, 5, 15, 5), 
            sliver: SliverGrid(delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return Container(
                  // color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("imgs/688.jpg", height: 110, fit: BoxFit.cover,),
                      SizedBox(height: 5),
                      Text("100元充值卡+Git 快捷口令鼠标兜售大促销", maxLines: 2, overflow:TextOverflow.ellipsis),
                      SizedBox(height: 10),
                      Text.rich(
                              TextSpan(children:<TextSpan>[
                                TextSpan(text: "￥", style: TextStyle(fontSize: 12, color: Colors.orange)),
                                TextSpan(text: "189", style:TextStyle(color:Colors.orange, fontSize: 16)),
                              ])
                            ),
                    ],
                  )
                );
              }, childCount: 12,
            ), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 0.52,          
            )
            ),
          ),


        ],
      ),
    );
  }
}