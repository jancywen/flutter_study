import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/finance/index.dart';
import 'package:flutter_study/finance/providers/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_recommend_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'cell/recommend_list_cell.dart';
import 'cell/banner_item.dart';
import 'cell/hot_article_cell.dart';

import 'package:flutter_study/finance/pages/webview/index.dart';
import 'package:flutter_study/finance/util/h5_api_util.dart';


import 'package:flutter_study/finance/pages/my/index.dart';
import 'package:flutter_study/finance/pages/login/index.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoRecommendProvider(),
      child: Consumer2<InfoRecommendProvider, UserProvider>(builder: (_, sp, up, __){ 
        return SmartRefresher(
          controller: sp.refreshController, 
          enablePullDown: true, 
          enablePullUp: true, 
          onRefresh: sp.onRefresh, 
          onLoading: sp.onLoading, 
          child: CustomScrollView(
            slivers: _siliverList(context, sp, up).toList()
          ),);
      } ));
  }

  List<Widget> _siliverList(BuildContext context ,InfoRecommendProvider sp, UserProvider up) {
    List<Widget> list = [];

    var banner = SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  child: sp.bannerList.length == 0 
                  ? Container() 
                  : Swiper(
                    itemBuilder: (_, index){
                    
                      return new BannerItem(
                        model: sp.bannerList[index],
                        );
                    },
                    itemCount: sp.bannerList.length, 
                    onTap: (index){
                      debugPrint(sp.bannerList[index].link);
                    },
                    pagination: new SwiperPagination(),
                    ), 
                  )
              );
    
    var hot = SliverToBoxAdapter(
                child: Container(
                  height: sp.hotList.length == 0 ? 0 : 135,
                  padding: EdgeInsets.fromLTRB(15, 7.5, 0, 7.5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sp.hotList.length,
                    itemExtent: 222,
                    itemBuilder: (context, index){
                      return HotArticleCell(
                        model: sp.hotList[index], 
                        onPressed:(){
                          var id = sp.hotList[index].id ?? "";
                          _pressedArticle(context, id);
                        });
                    }),
                  )
              );

    var settled = SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    child: Image.asset("imgs/settled_icon.png"),
                    onTap:(){
                      if(up.token == null) {
                        Navigator.pushNamed(context, "/login_page");
                      }else {
                        if (up.settledStatus == null || up.settledStatus == 1) {

                          Navigator.pushNamed(context, "/apply_page");
                        }else {
                          Navigator.pushNamed(context, "/apply_result");
                        }
                      }
                      
                    }
                  ),
                ),
                );
    
    var tav = SliverList(delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return RecommendListCell(
                    model: sp.recomList[index], 
                    onPressed: (){
                      var id = sp.recomList[index].id ?? "";
                      _pressedArticle(context, id);
                  },);
                }, 
                childCount: sp.recomList.length
              ));

    list.add(banner);
    list.add(hot);
    if (up.settledStatus != 3) {
      list.add(settled);
    }
    list.add(tav);
    return list;
  }

  void _pressedArticle(BuildContext context, String id) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WebViewPage(url: formatH5Url(H5API.info_detail_path, id), title: "文章详情");
       }
      )
    );
  }

}
