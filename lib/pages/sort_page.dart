import 'package:flutter/material.dart';

class SortPage extends StatefulWidget {
  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int _index = 0;

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

  _selectedSort( int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // Column(
      //   children: <Widget> [
      //     Container(
      //       height: 50,
      //       color: Colors.red,
      //     ),
          Row(
            children: [
              new Expanded(
                flex: 2,
                child: Container(
                  // color: Color(0xffe5e5e5),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        child: Container(
                          height: 40,
                          color: index == _index ? Color(0xfff7f7f7) : Color(0xfff0f0f0),
                          child: Center(
                            child: Text("sdsdsd")
                          ),
                        ), 
                        onTap: (){
                          _selectedSort(index);
                        },
                      );
                    }, itemCount: 10,),
                    )
                ),
              
              new Expanded(
                flex: 5,
                child: Container(
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        padding: EdgeInsets.only(top: 5, left:10, right: 10),
                        child: Row(
                          children: <Widget> [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), 
                              child: Container(
                                height: 100,
                                width: 100, 
                                child: Image.asset('imgs/688.jpg', fit: BoxFit.cover,),
                                ),
                            ),
                            Expanded(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:<Widget> [
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text("限时特惠 | ", style: TextStyle(), maxLines: 2),
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("￥232"),
                                    Text("sdsd")
                                  ],
                                )
                              ]
                            )
                            )
                          ]
                        ),
                        );
                    }, itemCount: 10,)
                  )
                )
            ],
          ),
      //   ]
      // )
    );
  }
}