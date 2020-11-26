
import 'package:flutter/material.dart';
import 'package:flutter_study/example/index.dart';
import 'package:flutter_study/example/models/example_model.dart';
import 'package:flutter_study/example/net/example_request_service.dart';
import 'package:flutter_study/example/net/request_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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



class ExampleProvider1 with ChangeNotifier {
  // banner
  List<ExampleBannerModel> _bannerList = [];
  /// 品牌
  List<ExampleBrandModel> _brandList = [];
  /// 商品
  List<ExampleProductModel> _productList = [];

  RefreshController _refreshController;


  List<ExampleBannerModel> get bannerList => _bannerList;
  List<ExampleBrandModel> get brandList => _brandList;
  List<ExampleProductModel> get productList => _productList;

  Function get onRefresh => _onRefresh;
  Function get onLoading => _onLoading;

  RefreshController get refreshController => _refreshController;



  ExampleHomeProvider(){
    _refreshController = RefreshController(initialRefresh: false);
    _onRefresh();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }
  
  void _onRefresh() async {
    await exampleHomeQuery().then((model) {
      return model as ExampleHomeModel;
    }).then((model) {
      print("model.banners.length:${ model.banners.length}");
      _bannerList = model.banners ?? [];
      _brandList = model.brands ?? [];
      _productList = model.products ?? [];
      _refreshController.refreshCompleted();
      notifyListeners();
    });
  }


  void _onLoading() async {
    await exampleHomeQuery().then((model) {
      return model as ExampleHomeModel;
    }).then((model) {
      _productList.addAll(model.products ?? []);
      _refreshController.refreshCompleted();
      notifyListeners();
    });
  }

}

class ExampleProvider2 with ChangeNotifier {

  final String someParam;

  List<String> _list = [];

  RefreshController _refreshController;

  List<String> get list => _list;
  RefreshController get refreshController => _refreshController;
  Function get onRefresh => _onRefresh;
  Function get onLoading => _onLoading;


  ExampleProvider2(this.someParam) {
    print("ExampleProvider2 初始化");
    print(someParam);
    _refreshController = RefreshController(initialRefresh: false);
    _onRefresh();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    print("dispose");
    super.dispose();
  }

  void _onRefresh()  async {
    await Future.delayed(Duration(seconds: 2))
      .then((_){
        _list=[
          "iterable",
          "iterable",
          "iterable",
          "iterable",
          "iterable"
          ];
        //   print(_list);
        // print(_list.length);
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
        notifyListeners();
      });
  }

  void _onLoading() async {
    await Future.delayed(Duration(seconds: 2))
      .then((_){
        _list.addAll([
          "iterable",
          "iterable",
          "iterable",
          "iterable",
          "iterable"
          ]);
        // print(_list);
        // print(_list.length);
        if (_list.length == 30) {
          _refreshController.loadNoData();
        }else {
          _refreshController.loadComplete();
        }
        notifyListeners();
      });
  }


}