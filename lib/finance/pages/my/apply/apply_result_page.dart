import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/finance/providers/index.dart';

class ApplyResultPage extends StatefulWidget {
  @override
  _ApplyResultPageState createState() => _ApplyResultPageState();
}

class _ApplyResultPageState extends State<ApplyResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0c0e12),
      appBar: _appBar(),
      body: Consumer<UserProvider>(
        builder: (context, sp, child){
          return Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Image.asset(
                        sp.settledStatus == 4 ? "imgs/apply/apply_reject.png" : "imgs/apply/apply_success.png", 
                        height: 150, 
                        width: 150),
                      SizedBox(height: 10),
                      Text(sp.settledStatus == 2 ? "您的申请资料提交成功！": 
                      sp.settledStatus == 3 ? "恭喜您！审核通过" : "抱歉！您的申请被拒绝", 
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      ),

                      SizedBox(height: 10),
                      Text(sp.settledStatus == 2 ? "平台将在2个工作日内审核 请留意接收审核结果通知短信": 
                      sp.settledStatus == 3 ? "您已开通Here平台名人专栏发文权限" : "原因：资质材料不清晰",
                      style: TextStyle(color: Color(0xff8f9092), fontSize: 14,)
                      ),
                      
                    ]
                  ),
                ),
              ), 
              Container(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Text("重新申请", style: TextStyle(color: Colors.white),),
                  ),
                  ),
                )
            ]
          );
        }
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Color(0xff0c0e12),
      brightness: Brightness.dark,
      title: Text("平台发文申请"),
    );
  }

}