import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


/// 行情 BaseURL
String market_base_url = "https://gx.com/remote";
/// 行情 websocket
String market_wws = 'wss://www.gx.com/ws/market/comp/echo';



class MarketHome extends StatefulWidget {
  @override
  _MarketHomeState createState() => _MarketHomeState();
}

class _MarketHomeState extends State<MarketHome> {
  final channel = IOWebSocketChannel.connect(market_wws);


  @override
  void initState() {
    super.initState();

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
      ],
    );
  }
  @override
  void dispose() {
    // 
    channel.sink.close();
    super.dispose();
  }
}

class TitleBar extends StatelessWidget {
  
  TextStyle barTitleStyle = TextStyle(color:Color(0xff727373), fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
          color: Color(0xff1B1D24),
          child: Stack(
            alignment:Alignment.center ,
            children: [
              Positioned(
                left: 15,
                child: Text("币种", style: barTitleStyle,)
                ),
              Positioned(
                right: 15,
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