import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_celebrity_provider.dart';
import 'cell/celebrity_List_cell.dart';

class CelebrityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoCelebrityProvider(),
      child: Consumer<InfoCelebrityProvider>(
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
                        return CelebrityListCell(model: cp.dataList[index], onPressed: (){},);
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


