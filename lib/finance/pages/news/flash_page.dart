import 'package:flutter/material.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/info_flash_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'cell/flash_list_cell.dart';


class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoFlashProvider(),
      child: Consumer<InfoFlashProvider>(builder: (_, fp,__){
        return SmartRefresher(
          controller: fp.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: fp.onRefresh,
          onLoading: fp.onLoading,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index){
                    return FlashListCell(model: fp.dataList[index], onPressed:(){debugPrint("pressed");});
                  },
                childCount: fp.dataList.length,
              ))
            ],
          ),
          );
      }),
    );
  }
}
