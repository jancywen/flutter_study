import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/finance/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_recommend_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          onRefresh: sp.onRefresh, 
          onLoading: sp.onLoading, 
          child: CustomScrollView(
            slivers: <Widget> [
              
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  child: Swiper(
                    itemBuilder: (_, index){
                    
                      return BannerItem(
                        model: sp.bannerList[index],
                        );
                    },
                    itemCount: sp.bannerList.length, 
                    onTap: (index){
                      print(sp.bannerList[index]);
                    },), 
                  )
              ),

              SliverToBoxAdapter(
                child: Container(
                  height: sp.hotList.length == 0 ? 0 : 135,
                  padding: EdgeInsets.fromLTRB(15, 7.5, 0, 7.5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sp.hotList.length,
                    itemExtent: 120,
                    itemBuilder: (context, index){
                      return HotArticleCell(
                        model: sp.hotList[index], 
                        onPressed:(){
                          print("press hot article" + sp.hotList[index].id ?? "");
                        });
                    }),
                  )
              ),


              SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    child: Image.asset("imgs/settled_icon.png"),
                    onTap:(){
                      print("入驻");
                    }
                  ),
                ),
                ),

              SliverList(delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return RecommendListCell(
                    model: sp.recomList[index], 
                    onPressed: (){
                      print( "press cell on " + sp.recomList[index].id);
                  },);
                }, 
                childCount: sp.recomList.length
              )),
              
            ]
          ),);
      } ));
  }
}


class BannerItem extends StatelessWidget {

  final BannerModel model;

  BannerItem({Key key, this.model}): super(key: key);

  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
        child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // child: Image.asset("imgs/688.jpg", width: 130, height: 82),
              child: CachedNetworkImage(
                imageUrl: model.url ?? "",
                width: 130,
                height: 82,
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                errorWidget: (context, url, _) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                ),
            ),
      );
  }
}

class RecommendListCell extends StatelessWidget {

  final ArticleModel model;
  final VoidCallback onPressed;
  RecommendListCell({Key key, this.model, this.onPressed}) : super(key: key);

  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onPressed,
      child:Container(
        height: 82,
        padding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
        child: Row(
          children: <Widget> [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(model.title ?? "", maxLines: 2, style: titleStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Text(model.platformName ?? "", style: subTitleStyle),
                      Text(model.releaseTime ?? "", style: subTitleStyle)
                    ]
                  )
                ],
              )
            ,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // child: Image.asset("imgs/688.jpg", width: 130, height: 82),
              child: CachedNetworkImage(
                imageUrl: model.firstPic ?? "",
                width: 130,
                height: 82,
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                errorWidget: (context, url, _) => Image.asset("imgs/placeholder.png", width: 130, height: 82),
                ),
            )
          ]
        )
      )
    );
  }
}

class HotArticleCell extends StatelessWidget {
  final ArticleModel model;
  final VoidCallback onPressed;
  HotArticleCell({Key key, this.model, this.onPressed}) : super(key: key);


  final markStyle = TextStyle(color: Color.fromARGB(255, 255, 211, 99), fontSize: 12,fontWeight: FontWeight.bold);
  final titleStyle = TextStyle(color: Colors.white, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.white30, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("热门文章",style: markStyle),
            Text(model.title ?? "", style: titleStyle,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.platformName ?? "", style: subTitleStyle),
                Text(model.releaseTime ?? "", style: subTitleStyle)
              ],
            )

          ],
        ),
      ),
    );
  }
}