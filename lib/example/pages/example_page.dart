import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_study/example/provider/index.dart';
import 'package:flutter_study/example/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExamplePage extends StatelessWidget {

  ExampleProvider _exampleProvider = ExampleProvider();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => _exampleProvider, 
      child: Scaffold(
        appBar: AppBar(title: Text("Example page"),),
        body: Center(
          child: Column(
            children: <Widget>[
              Selector(builder: (_, ExampleModel model, __){
                return Text("example: ${model.name}");
              },
               selector: (_, ExampleProvider exampleProvider){
                 return exampleProvider.exampleModel;
               }),

               Consumer(builder: (BuildContext context, ExampleProvider exampleProvider, 
               Widget child){
                 return Text("time: ${exampleProvider.exampleModel.time}");
               })
            ],
          )
        )
      ),
    );
  }
}


class ExamplePage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Example page1"),),
        body: Column(
          children: <Widget> [
            Consumer<ExampleSimpleProvider1>(
              builder: (context, simpleProvider, child) {
                return Center(
                  child: simpleProvider.exampleModel == null? null: Text("p1: ${simpleProvider.exampleModel.p1}"));
              }),
            
            SizedBox(height: 10),

            Consumer2<ExampleSimpleProvider1, ExampleSimpleProvider2>(
              builder: (context, sp1, sp2, child){
                return Column(
                  children: <Widget> [
                    Container(
                      child: sp1.exampleModel == null ? null : Text("p1: ${sp1.exampleModel.p1}")
                    ),
                    Container(
                      child: sp2.exampleModel == null ? null : Text("p2: ${sp2.exampleModel.p2}")
                    ),
                  ]
                );
              }),
            
            SizedBox(height: 20),

            Consumer3<ExampleSimpleProvider1, ExampleSimpleProvider2, ExampleSimpleProvider3>(
              builder: (context, sp1, sp2, sp3, child){
                return Column(
                  children: <Widget> [
                    Container(
                      child: sp1.exampleModel == null ? null : Text("p1: ${sp1.exampleModel.p1}")
                    ),
                    Container(
                      child: sp2.exampleModel == null ? null : Text("p2: ${sp2.exampleModel.p2}")
                    ),
                    Container(
                      child: sp3.exampleModel == null ? null : Text("p3: ${sp2.exampleModel.p3}")
                    ),
                  ]
                );
              }),

            FlatButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ExamplePage2("some");
              }));
            }, child: Text("push to"))

          ]
        ),
      );
  }
}


class ExamplePage2 extends StatelessWidget {
  final String someParam;
  ExamplePage2(this.someParam);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> ExampleProvider2(someParam),
      child: Scaffold(
        appBar: AppBar(title: Text("single provider page")),
        body: Consumer<ExampleProvider2>(builder: (_, sp, __){
          return SmartRefresher(
            controller: sp.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: sp.onRefresh,
            onLoading: sp.onLoading,
            child: 
              ListView.builder(itemBuilder: (c, i){
                return ListTile(title: Text("${sp.list[i]} -- $i"));
                }, 
                itemCount: sp.list.length, 
                itemExtent: 50,
                ),
            );
        },)
      ),
    );
  }
}



