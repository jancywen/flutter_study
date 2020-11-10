
import 'package:flutter/material.dart';
import 'package:flutter_study/models/example_model.dart';
import 'package:flutter_study/net/example_request_service.dart';
import 'package:flutter_study/net/request_service.dart';

class ExampleProvider with ChangeNotifier {

  ExampleModel _exampleModel = ExampleModel(name: "", time: "");

  List<ExampleElementModel> exampleElementModelList = [];

  int page = 1;
  int size = 20;


  ExampleModel get exampleModel => _exampleModel;



  ExampleProvider() {
    loadExampleData();
  }


  loadExampleData() async {
    await exampleQuery({"p1": ""}).then((model){
      _exampleModel = model;
      notifyListeners();
    });
  }


  loadSubExampleData() async {
    await subExampleQuery({"page": page, "size": size})
      .then((subModel) {
        if (page == 1) {
          exampleElementModelList = subModel.elementList;
        }else {
          exampleElementModelList.addAll(subModel.elementList);
        }
        notifyListeners();
      });
  }

  refresh() async {
    this.page = 1;
    this.exampleElementModelList = [];
    await loadSubExampleData();
  }

  nextPage(){
    this.page++;
    loadSubExampleData();
  }

}

class ExampleSimpleProvider1 with ChangeNotifier {

  ExampleSimpleModel _exampleModel;

  ExampleSimpleModel get exampleModel => _exampleModel;

  ExampleSimpleProvider1() {
    loadExampleData();
  }

  loadExampleData() async {
    await exampleQuery({"p1": ""}).then((model){
      _exampleModel = model;
      notifyListeners();
    });
  }

}

class ExampleSimpleProvider2 with ChangeNotifier {

  ExampleSimpleModel _exampleModel;

  ExampleSimpleModel get exampleModel => _exampleModel;

  ExampleSimpleProvider2() {
    loadExampleData();
  }

  loadExampleData() async {
    await exampleQuery({"p1": ""}).then((model){
      _exampleModel = model;
      notifyListeners();
    });
  }

}

class ExampleSimpleProvider3 with ChangeNotifier {

  ExampleSimpleModel _exampleModel;

  ExampleSimpleModel get exampleModel => _exampleModel;

  ExampleSimpleProvider3() {
    loadExampleData();
  }

  loadExampleData() async {
    await exampleQuery({"p1": ""}).then((model){
      _exampleModel = model;
      notifyListeners();
    });
  }

}