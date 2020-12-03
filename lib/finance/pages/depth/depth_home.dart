import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/depth_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'depth_list_cell.dart';
class DepthHome extends StatefulWidget {
  @override
  _DepthHomeState createState() => _DepthHomeState();
}

class _DepthHomeState extends State<DepthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("深度好文"),
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 12, 14, 18),
        ),
      backgroundColor: Color.fromARGB(255, 12, 14, 18),
      body: ChangeNotifierProvider(
        create: (_)=> DepthProvider(),
        child: Consumer<DepthProvider>(builder: (_, dp, __){
          return SmartRefresher(
            controller: dp.refreshController,
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: dp.onRefresh,
            onLoading: dp.onLoading,
            child: CustomScrollView(
              
              slivers: [
              SliverList(delegate: SliverChildBuilderDelegate(
                (_, index){
                  return DepthListCell(model: dp.dataList[index], onPressed:(){print("press");});
                }, 
                childCount: dp.dataList.length))
            ],),
            );
        }),
        ),
    );
  }
}