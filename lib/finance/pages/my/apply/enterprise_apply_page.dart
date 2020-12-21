import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'apply_item_widget.dart';
import 'sample_dialog.dart';
import 'package:image_picker/image_picker.dart';

class EnterpriseApplyPage extends StatefulWidget {
  @override
  _EnterpriseApplyPageState createState() => _EnterpriseApplyPageState();
}

class _EnterpriseApplyPageState extends State<EnterpriseApplyPage> {
  
  TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle placeholderStyle = TextStyle(color: Color(0xff8f9092), fontSize: 14,);
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle tipStyle = TextStyle(color: Color(0xffffd363), fontSize: 12, );
  TextStyle subTitleStyle = TextStyle(color: Color(0xff727373), fontSize: 12);
  final ImagePicker _picker = ImagePicker();

  bool check;

  List<ApplyItemModel> cardList;
  List<ApplyItemModel> materialList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check = false;
    cardList = [
      ApplyItemModel(
        type: ApplyItemType.businessLicense,
        imv: ""),
    ];
    materialList = [
      ApplyItemModel(
        type: ApplyItemType.material,
        imv: ""),
    ];
  }

  /// 上传图片
  void _tapItem( ApplyItemModel item) async {

    await onPressedGetImageButton(context, 
      (ImageSource source) async{
        try {
          final pickedFile = await _picker.getImage(source: source);
          setState(() {
            switch (item.type) {
              case ApplyItemType.businessLicense:
                cardList.first.file = pickedFile;
                break;
              case ApplyItemType.material:
                materialList.insert(0, ApplyItemModel(type: ApplyItemType.material, file: pickedFile));
                break;
              default:
                break;
            }
          });
        } catch (e) {
          debugPrint(e.toString());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0c0e12),
      padding: EdgeInsets.only(top: 0, left: 15, right: 15),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("基本信息", style: titleStyle,),
          SizedBox( height: 10, ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: TextField(
                style: textStyle,
                decoration: InputDecoration(
                  hintText: '请输入真实姓名', 
                  hintStyle: placeholderStyle,
                  filled: true,
                  fillColor: Color(0xff1b1d24),
                  border: InputBorder.none
                ),
              )
            ),
            height: ScreenUtil().setHeight(84),
          ),
          SizedBox( height: 10,),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: TextField(
                style: textStyle,
                decoration: InputDecoration(
                  hintText: '请输入公司名称', 
                  hintStyle: placeholderStyle,
                  filled: true,
                  fillColor: Color(0xff1b1d24),
                  border: InputBorder.none
                ),
              )
            ),
            height: ScreenUtil().setHeight(84),
          ),
          SizedBox( height: 20,),
          Row(
            children:[
              Text("营业执照", style: titleStyle,),
              FlatButton(
                onPressed: (){
                  showBusinessDialog(context);
                }, 
                child: Text("查看样本", style: tipStyle,))
            ]
          ),

              ]
            )
          ),

          SliverGrid(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return ApplyItemWidget(
                  item: cardList[index], 
                  onTapItem: 
                    _tapItem
                  ,);
              }, childCount: cardList.length), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              ),
          ),

          SliverToBoxAdapter(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Row(
                  children:[
                    Text("资质材料", style: titleStyle,),
                    FlatButton(
                      onPressed: (){
                        showMaterialDialog(context);
                      }, 
                      child: Text("查看样本", style: tipStyle,))
                  ]
                ),
                Text(
                  "注：微博主页/头条主页截图 ≤4张JPG/PNG/JPEG图",
                  style:subTitleStyle
                ),
                SizedBox(height: 10.0),
              ],
            )
          ),

          SliverGrid(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return ApplyItemWidget(item: materialList[index], 
                onTapItem: 
                  _tapItem
                ,);
              }, childCount: materialList.length), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              ),
          ),

          SliverToBoxAdapter(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xff333333))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xff333333))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xff333333))
                  )
                  ) ,
                ),
          SizedBox(height: 80,),
          Container(
            height: 30,
            child:
          Row(children: <Widget>[
            Checkbox(
              // focusColor: Color(0xff727373),
              // hoverColor: Color(0xff727373),
              value: this.check, 
              onChanged: (val){
                this.setState(() {
                  this.check = !check;
                });
              }),
            Text("我已阅读并同意", style: subTitleStyle,),
            GestureDetector(
              child: Text("《平台入驻服务条款》",style: tipStyle,),
              onTap: (){
                debugPrint("查看入驻协议");
              },
              )
          ],),),
          SizedBox(height: 10,),
          FlatButton(
            color: Color(0xffffd363),
            height: 46,
            minWidth: ScreenUtil().screenWidth ,
            onPressed: (){
              debugPrint("tijiao");
            }, 
            child: Text("提交申请")
            ),
          SizedBox(height: 20),
            ],)
          )
        ],
      ),
      
    );
  }




}