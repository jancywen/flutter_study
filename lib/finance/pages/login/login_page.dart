import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:flutter_study/finance/network/request_service.dart';
import 'package:flutter_study/finance/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _phoneController;
  TextEditingController _codeController;

  int _countdownTime = 0;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phoneController = TextEditingController();
    _codeController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {

    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff0c0e12),
      body:
    Stack(
      children: [
        Positioned(
          left: 15,
          top: 40,
          child: Container(
            height: 16, 
            width: 40,
          child: 
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Image.asset("imgs/nav_close.png", width:16, height: 16),
            onTap: (){
              Navigator.pop(context);
            },
            ))
          ),
        Positioned(
          left: 30,
          top: 100,
          child: Text("登录",style: TextStyle(color: Color(0xffffd363), fontSize: 30, fontWeight: FontWeight.w500),)
          ),
        Positioned(
          left: 30,
          top: 148,
          child: Container(height: 20,
              child: 
          Row(
            children: [
              Text("还么有账号，立即",style: TextStyle(color: Color(0xff727373), fontSize: 16, )),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterPage();
                  }));
                },
                child: Text("注册",style: TextStyle(color: Color(0xffffd363), fontSize: 16, )),
                )
              
            ],
          ),)
          ),
        
        Positioned(
          left: 30,
          top: 230,
          child: Container(
            height: 54,
            width: ScreenUtil().screenWidth - 60,
            child: Expanded(child: TextField(
              style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: '请输入手机号', 
                hintStyle: TextStyle(fontSize: 16, color: Color(0xff727373))),

            )),
            ),
          ),

        Positioned(
          left: 30,
          top: 300,
          child: Container(
            height: 54,
            width: ScreenUtil().screenWidth - 60,
            child: Row(children: [
              Expanded(child: TextField(
                style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
              controller: _codeController,
              decoration: InputDecoration(
                hintText: '请输入验证码', 
                hintStyle: TextStyle(fontSize: 16, color: Color(0xff727373))),

            )),
            FlatButton(
              height: 50,
              minWidth: 60,
              onPressed: countDownAction, 
              child: Text(
                 _countdownTime > 0 ? '$_countdownTime s后重新获取' : '获取验证码', 
                 style: TextStyle(
                   color: Colors.white60 ),))

            ],)
            
            ),
          ),

          Positioned(
            left: 30,
            top: 400,
            child: Container(
              color: Color(0xffffd363),
              height: 46,
              width: ScreenUtil().screenWidth - 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: FlatButton(
                  onPressed: () => loginAction(context), 
                  child: Text("登录", style: TextStyle(color: Colors.white60))),
              ),
              )),
      ],
    ));
  }


  void countDownAction() {
    
    if (_phoneController.text.length != 11) {return;}

    sendVerificationCode({'countryCode': 86, 'mobile': _phoneController.text, 'useFor': 2})
    .then((value) {
      if(_countdownTime == 0) {
       setState(() {
          _countdownTime = 60;
        });
        startCountdownTimer();
      }
    }, onError: (e){
      print("error");
    });


    
  }

void startCountdownTimer() {
  const oneSec = const Duration(seconds: 1);

  var callback = (timer) => {
    setState(() {
      if (_countdownTime < 1) {
        _timer.cancel();
      } else {
        _countdownTime = _countdownTime - 1;
      }
    })
  };

  _timer = Timer.periodic(oneSec, callback);
}

void loginAction(BuildContext context) {
  UserProvider provider = Provider.of<UserProvider>(context, listen: false);

  loginQuery({'countryCode': 86, 'mobile': _phoneController.text, 'smsCode': _codeController.text})
  .then((value) {
    if (value["token"] != null) {
      provider.saveToken(value["token"]);
      provider.getUserInfo();
      provider.getSettledStatus();
      Navigator.pop(context);
    }

  });
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

}