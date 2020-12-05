import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_defi_provider.dart';
import 'cell/recommend_list_cell.dart';

import 'package:flutter_study/finance/pages/webview/index.dart';
import 'package:flutter_study/finance/util/h5_api_util.dart';


class DefiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoDefiProvider(),
      child: Consumer<InfoDefiProvider>(
        builder: (_, cp, __){
          return SmartRefresher(
            controller: cp.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: cp.onRefresh,
            onLoading: cp.onLoading,
            child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index){
                        return RecommendListCell(model: cp.dataList[index], onPressed: (){
                          var id = cp.dataList[index].id ?? "";
                          _pressedArticle(context, id);
                        },);
                      },
                      childCount: cp.dataList.length,
                      ),
                    
                    )
                ],
              ),
            );
        }

      ),
    );
  }


    void _pressedArticle(BuildContext context, String id) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WebViewPage(url: formatH5Url(H5API.info_detail_path, id), title: "文章详情");
       }
      )
    );
  }

}
