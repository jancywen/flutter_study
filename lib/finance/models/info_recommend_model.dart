

import 'package:flutter_study/finance/models/index.dart';

import 'article_model.dart';
import 'banner_model.dart';

class RecommendHeaderModel {

  List<BannerModel> bannerList;
  List<ArticleModel> startArticleList;

  RecommendHeaderModel({
    this.bannerList, 
    this.startArticleList});
  
  factory RecommendHeaderModel.fromJson(Map<String, dynamic> json) => RecommendHeaderModel (
    bannerList: List<BannerModel>.from(json["bannerList"].map((x) => BannerModel.fromJson(x))),
    startArticleList: List<ArticleModel>.from(json["startArticleList"].map((x) => ArticleModel.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "bannerList": List<dynamic>.from(bannerList.map((e) => e.toJson())),
    "startArticleList": List<dynamic>.from(startArticleList.map((e) => e.toJson())),
  };

}

class ArticleListModel {
  int total;
  int size;
  List<ArticleModel> articleList;

  ArticleListModel({this.total,this.size, this.articleList});

  factory ArticleListModel.fromJson(Map<String, dynamic> json) => ArticleListModel (
    total: json["total"],
    size: json["size"],
    articleList: List<ArticleModel>.from(json["articleList"].map((x) => ArticleModel.fromJson(x)))
    );

  Map<String, dynamic> toJson() => {
    "total": total,
    "articleList": List<dynamic>.from(articleList.map((e)=>e.toJson())),
  };
}