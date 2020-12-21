import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WebViewPage extends StatefulWidget {

  String url;
  final String title;
  final bool isLocalUrl;

  WebViewController _webViewController;

  WebViewPage({this.url, this.isLocalUrl = false, this.title});

  @override
  _WebViewPage createState() => _WebViewPage();


}

class _WebViewPage extends State<WebViewPage> {

  String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'jsbridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        debugPrint(message.message);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 14, 18),
      appBar: _buildAppbar(),
      body: _buildBody()
    );
  }

  _buildAppbar() {
    return AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 12, 14, 18),
        title: Text(_title, ),
        centerTitle: true,
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 1,
          width: double.infinity,
          child: const DecoratedBox(decoration: BoxDecoration(color: Color(0xFF0c0e12))),
        ),
        Expanded(
          flex: 1,
          child: WebView(
            initialUrl: widget.isLocalUrl ? Uri.dataFromString(widget.url, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                .toString(): widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              jsBridge(context)
            ].toSet(),
            onWebViewCreated: (WebViewController controller){
              widget._webViewController = controller;
              if(widget.isLocalUrl){
                  _loadHtmlAssets(controller);
              }else{
                controller.loadUrl(widget.url);
              }
              controller.canGoBack().then((value) => debugPrint(value.toString()));
              controller.canGoForward().then((value) => debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            onPageFinished: (String value){
              widget._webViewController.evaluateJavascript('document.title')
                  .then((title) {
                     debugPrint(title);
                     setState(() {
                       _title = title;
                     });
                  });
              
              widget._webViewController.evaluateJavascript("window.isLogin=是否登录").then((value)=> debugPrint(value));
            },
            navigationDelegate: (NavigationRequest request){
              if (request.url.startsWith("myapp://")) {
                debugPrint("即将打开： ${request.url}");
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
      ],
    );
  }

//加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(widget.url);
    controller.loadUrl(Uri.dataFromString(htmlPath,mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

}