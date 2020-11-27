

import 'package:flutter_study/finance/models/index.dart';

import 'article_model.dart';
import 'banner_model.dart';

class RecommendHeaderModel {

  List<BannerModel> bannaList;
  List<ArticleModel> startArticleList;

  RecommendHeaderModel({
    this.bannaList, 
    this.startArticleList});
  
  factory RecommendHeaderModel.fromJson(Map<String, dynamic> json) => RecommendHeaderModel (
    // bannaList: List<BannerModel>.from(json["bannaList"].map((x) => BannerModel.fromJson(x))),
    startArticleList: List<ArticleModel>.from(json["startArticleList"].map((x) => ArticleModel.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "bannaList": List<dynamic>.from(bannaList.map((e) => e.toJson())),
    "startArticleList": List<dynamic>.from(startArticleList.map((e) => e.toJson())),
  };

}

class RecommendListModel {
  int total;
  List<ArticleModel> articleList;

  RecommendListModel({this.total, this.articleList});

  factory RecommendListModel.fromJson(Map<String, dynamic> json) => RecommendListModel (
    total: json["total"],
    articleList: List<ArticleModel>.from(json["articleList"].map((x) => ArticleModel.fromJson(x)))
    );

  Map<String, dynamic> toJson() => {
    "total": total,
    "articleList": List<dynamic>.from(articleList.map((e)=>e.toJson())),
  };
}