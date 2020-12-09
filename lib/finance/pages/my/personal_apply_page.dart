import 'package:flutter/material.dart';

class PersonalApplyPage extends StatefulWidget {
  @override
  _PersonalApplyPageState createState() => _PersonalApplyPageState();
}

class _PersonalApplyPageState extends State<PersonalApplyPage> {


  TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle placeholderStyle = TextStyle(color: Color(0xff8f9092), fontSize: 14,);
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle tipStyle = TextStyle(color: Color(0xffffd363), fontSize: 12, );
  TextStyle subTitleStyle = TextStyle(color: Color(0xff727373), fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.only(top: 0, left: 15, right: 15),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("基本信息", style: titleStyle,),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: '请输入真实姓名', 
              hintStyle: placeholderStyle,
              filled: true,
              fillColor: Color(0xff1b1d24),
              border: OutlineInputBorder()
              ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: '请输入身份证号码', 
              hintStyle: placeholderStyle,
              filled: true,
              fillColor: Color(0xff1b1d24),
              border: OutlineInputBorder()
              ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children:[
              Text("证件照", style: titleStyle,),
              FlatButton(
                onPressed: (){
                  print("证件照");
                }, 
                child: Text("查看样本", style: tipStyle,))
            ]
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            children:[
              Text("资质材料", style: titleStyle,),
              FlatButton(
                onPressed: (){
                  print("资质材料");
                }, 
                child: Text("查看样本", style: tipStyle,))
            ]
          ),
          Text(
            "注：微博主页/头条主页截图 ≤4张JPG/PNG/JPEG图",
            style:subTitleStyle
            ),
          SizedBox(height: 10,),
          Text("备注", style: titleStyle,),
          SizedBox(height: 10,),
          TextField(
            style: textStyle,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: '填写微信公众号主页链接、头条用户名、微博主页链接等', 
              hintStyle: placeholderStyle,
              filled: false,
              fillColor: Color(0xff1b1d24),
              border: OutlineInputBorder()
              ),
          ),
          SizedBox(height: 100,),

          FlatButton(
            color: Color(0xffffd363),
            height: 46,
            onPressed: (){
              print("tijiao");
            }, 
            child: Text("提交申请")
            )
        ],),
    );
  }
}