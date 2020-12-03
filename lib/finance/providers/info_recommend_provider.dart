import 'package:flutter/material.dart';

import 'package:flutter_study/finance/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_study/finance/network/request_service.dart';


class InfoRecommendProvider extends ChangeNotifier {
  List<BannerModel> _bannerList = [];
  List<ArticleModel> _hotList = [];
  List<ArticleModel> _recomList = [];
  RefreshController _refreshController;

  List<BannerModel> get bannerList => _bannerList;
  List<ArticleModel> get hotList => _hotList;
  List<ArticleModel> get recomList => _recomList;
  RefreshController get refreshController => _refreshController;
  Function get onRefresh => _onRefresh;
  Function get onLoading => _onLoading;

  // Function get onRefreshList => _onRefreshList;
  // Function get onLoadingList => _onLoadingList;

  int page = 1;
  int size = 20;
  var total = 0;

  InfoRecommendProvider() {
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
    this.page = 1;
    Future.wait([recommendHeaderQuery({}), 
                 recommendListQuery({'page': page, 'size': size})])
          .then((value) {
            var m1 = value.first as RecommendHeaderModel;
            if (m1 != null && m1.startArticleList != null) {
              _hotList = m1.startArticleList;
              _bannerList = m1.bannerList;
            }

            var m2 = value.last as RecommendListModel;
            if (m2 != null) {
              this.page++;
              total = m2.total;
              _recomList = [];
              _recomList.addAll(m2.articleList);
            }
            _loadCompleteData();
          }, onError: _loadError);
  }


  void _onLoading() async {
    _onLoadingList();
  }

  // void _onRefreshHeader() async {
  //   await recommendHeaderQuery(null).then((model) {
  //     // _bannerList = model.bannaList;
  //     _hotList = model.startArticleList;
  //   });
  // }

  // void _onRefreshList() async {
  //   this.page = 1;
  //   _recomList = [];
  //   _loadList();
  // }

  void _onLoadingList() async {
    _loadList();
  }

  void _loadList()async {

    var param = Map();
    param['page'] = page;
    param['size'] = size;

  await recommendListQuery(param)
    .then((model){
      if (model != null) {
        this.page++;
        total = model.total;
        _recomList.addAll(model.articleList);
      }
      _loadCompleteData();
    }, onError: _loadError);
  }

  _loadCompleteData() {
    notifyListeners();
    _refreshController.refreshCompleted();
    if (_recomList.length == total) {
       _refreshController.loadNoData();
    }else {
      _refreshController.loadComplete();
    }
  }

  _loadError(e) {
    notifyListeners();
    _refreshController.loadFailed();
    _refreshController.refreshFailed();
  }
}