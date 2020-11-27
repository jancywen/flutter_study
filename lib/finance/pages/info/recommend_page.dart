import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_recommend_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoRecommendProvider(),
      child: Consumer<InfoRecommendProvider>(builder: (_, sp, __){ 
        return SmartRefresher(
          controller: sp.refreshController, 
          enablePullDown: true, 
          enablePullUp: true, 
          onRefresh: sp.onRefreshList, 
          onLoading: sp.onLoadingList, 
          child: CustomScrollView(
            slivers: <Widget> [
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  child: sp.bannerList.length == 0 ? null: Swiper(
                    itemBuilder: (_, index){
                    
                      return Image.asset("imgs/688.jpg", fit: BoxFit.cover);
                    },
                    itemCount: sp.bannerList.length, 
                    onTap: (index){
                      print(index);
                    },), 
                  )
              ),
/*
              SliverToBoxAdapter(
                child: Container(
                  height: 135,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sp.hotList.length,
                    itemExtent: 120,
                    itemBuilder: (context, index){
                      return Container(
                        width: 220,
                        height: 120,
                        color: Colors.red,
                        child: Center(
                          child: Text(sp.hotList[index].title),
                        ),
                      );
                    }),
                  )
              ),*/
              
              SliverList(delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Container(
                    child: Row(children: [
                      Text(sp.recomList[index].title),
                    ],)
                    ,);
                }, 
                childCount: sp.recomList.length
              )),
              
            ]
          ),);
      } ));
  }
}