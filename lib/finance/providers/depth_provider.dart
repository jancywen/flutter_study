import 'package:flutter/material.dart';

import 'package:flutter_study/finance/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_study/finance/network/request_service.dart';


class DepthProvider extends ChangeNotifier {
  List<ArticleModel> _dataList = [];
  RefreshController _refreshController;
  var page = 1;
  var size = 20;
  var total = 0;

  List<ArticleModel> get dataList => _dataList;
  RefreshController get refreshController => _refreshController;
  Function get onRefresh => _onRefresh;
  Function get onLoading => _onLoading;

  DepthProvider(){
    _refreshController = RefreshController(initialRefresh: true);
  }
  void _onRefresh() async{
    this.page = 1;
    _dataList = [];
    _loadFlash();
  }
  void _onLoading() async{
    _loadFlash();
  }

  void _loadFlash() async {
    await depthListQuery({'page': page, 'size': size})
    .then((model) {
      if (model != null) {
        _dataList.addAll(model.articleList);
        page++;
      }
      _loadingComplete();
    }).catchError(onError);
  }

  void _loadingComplete() {
    notifyListeners();
    _refreshController.refreshCompleted();
    if (total == _dataList.length) {
      _refreshController.loadNoData();
    }else {
      _refreshController.loadComplete();
    }
  }
  void onError(e) {
    notifyListeners();
    _refreshController.loadFailed();
    _refreshController.refreshFailed();
  }
}