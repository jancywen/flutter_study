import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_study/finance/models/index.dart';
import 'dart:convert';
import 'package:archive/archive.dart';

/// 行情 BaseURL
String market_base_url = "https://gx.com/remote";
/// 行情 websocket
String marketWws = 'wss://www.gx.com/ws/market/comp/echo';

String testWWs = "ws://echo.websocket.org";

List<String> coinList = ["BTC", "ETH", "XRP", "BCH", "LINK", "LTC", "ADA", "EOS", "XMR", "TRX", "XLM", "XTZ", "ATOM", "DASH", "ETC", "IOTA", "ZEC", "FIL", "UNI", "COMP"];


class MarketHome extends StatefulWidget {

  final channel = IOWebSocketChannel.connect(marketWws);

  @override
  _MarketHomeState createState() => _MarketHomeState();
}

class _MarketHomeState extends State<MarketHome> with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  var _rate = 6.75;

  List<String> symbolList = coinList.map((e) => e+"_USDT").toList();

  @override
  void initState() {
    super.initState();
    // 注册监听器
    WidgetsBinding.instance.addObserver(this);
    debugPrint("注册监听器");
    subTicker();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // 前台
      subTicker();
    }else if (state == AppLifecycleState.paused) {
      // 后台
      unsubTicker();
    }
  }

  void subTicker() {
    debugPrint("sub");
    // widget.channel.sink.add("data");
    var sub = {"cmd":"sub","args":["ticker"]};
    String jsonString = jsonEncode(sub);
    widget.channel.sink.add(jsonString);
  }

  void unsubTicker() {
    debugPrint("unsub");
    var unsub = {"cmd":"unsub","args":["ticker"]};
    String jsonString = jsonEncode(unsub);
    widget.channel.sink.add(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 14, 18),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 12, 14, 18),
        title: Text("行情", ),
        centerTitle: true,
    );
  }

  _buildBody() {
    return Column(
      children: [
        TitleBar(),
        SizedBox(height: 15),
        Expanded(
          child: StreamBuilder(
            stream: widget.channel.stream,
            builder: (context,AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                var list = _gunZip(snapshot.data);
                return  ListView.builder(
                itemCount: list.length,
                itemExtent: 85,
                itemBuilder: (BuildContext context, int index){
                  return MarketListCell(model: list[index], rate: _rate,);
                },
              );
              }else {
                return Text("nothing");
              }
            },
          )
        )
      ],
    );
  }
  
  @override
  void dispose() {
    // 
    widget.channel.sink.close();
    super.dispose();
    // 移除监听器
    WidgetsBinding.instance.removeObserver(this);
    debugPrint("移除监听器");
  }

//解压
  _gunZip(List<int> data) {
    // debugPrint("gunzip");
    List<int> bytes = GZipDecoder().decodeBytes(data);
    String json = String.fromCharCodes(bytes);
    MarketData md = MarketData.fromJson(jsonDecode(json));
    // debugPrint(md.data.where((element) => element.quoteAsset == "USDT").length);
    return md.data.where((element) => symbolList.contains(element.symbol) ?? false).toList();
  }
}

class TitleBar extends StatelessWidget {
  
  final barTitleStyle = TextStyle(color:Color(0xff727373), fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
          color: Color(0xff1B1D24),
          child: Stack(
            alignment:Alignment.center ,
            children: [
              Positioned(
                left: 30,
                child: Text("币种", style: barTitleStyle,)
                ),
              Positioned(
                right: 30,
                child: Text("涨幅榜", style: barTitleStyle,)
                ),
              Positioned(
                right: 110,
                child: Text("价格", style: barTitleStyle,)
                ),
            ],
          ),
    );
  }
}

class MarketListCell extends StatelessWidget {

  final Market model;
  final double rate;
  MarketListCell({Key key, this.model, this.rate});

  final baseStyle = TextStyle(color:Colors.white, fontSize: 16,fontWeight: FontWeight.w600);
  final quoteStyle = TextStyle(color:Color(0xff8f9092), fontSize: 12,fontWeight: FontWeight.w600);
  final subTitleStyle = TextStyle(color: Color(0xff8f9092), fontSize: 12,);
  final greenStyle = TextStyle(color: Color(0xff0fab70), fontSize: 15,fontWeight: FontWeight.w600);
  final redStyle = TextStyle(color: Color(0xffe1354c), fontSize: 15,fontWeight: FontWeight.w600);
  final rateStyle = TextStyle(color: Color(0xffffffff), fontSize: 12,);

  @override
  Widget build(BuildContext context) {

    var cny = 0.0;
    if (model.latest != null) {
      var lat = double.parse(model.latest);
      cny = rate * lat;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          height: 72,
          color: Color(0xff1b1d24),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 15,
                top:14,
                child:Row(
                  children: <Widget>[
                    Text("${model.baseAsset}", style: baseStyle,),
                    Text("/${model.quoteAsset}", style: quoteStyle,),
                  ]
                )
              ),
              Positioned(
                left: 15,
                bottom: 14,
                child: Text("成交量：${model.volume}", style: subTitleStyle,)
              ),
              Positioned(
                top: 14,
                right: 95,
                child: Text("${model.latest}", style: model.priceChangePercent.contains("-") ? redStyle : greenStyle,),
              ),
              Positioned(
                bottom: 14,
                right: 95,
                child: Text("≈${cny.toStringAsFixed(2)}CNY", style: subTitleStyle,),
              ),
              Positioned(
                right: 10,
                top: 22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Container(
                    width: 70, 
                    height: 30,
                    color: model.priceChangePercent.contains("-") ? Color(0xffe13c45) : Color(0xff0fab70),
                    child: Center(
                      child: Text("${model.priceChangePercent}%", style: rateStyle,),
                    ),
                    ),
                ))
            ]
          ),
        )
      ),
    );
  }
}