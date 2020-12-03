import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_defi_provider.dart';
import 'cell/recommend_list_cell.dart';


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
                        return RecommendListCell(model: cp.dataList[index], onPressed: (){},);
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
}
