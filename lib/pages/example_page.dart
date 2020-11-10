

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_study/provider/index.dart';
import 'package:flutter_study/models/index.dart';


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

          ]
        ),
      );
  }
}