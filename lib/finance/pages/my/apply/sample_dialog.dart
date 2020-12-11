import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';

// 证件
  void showCardDialog(BuildContext context) {
    Dialog materialDialog = Dialog(
      backgroundColor: Color(0xff262931),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)), //this right here
      child: Container(
        height: 376.0,
        width: 301.0,
        child: Column(
          children: <Widget> [
            Container(
              height: 55,
              width: ScreenUtil().screenWidth,
              child: Stack(
                
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned.fill(
                    child: Expanded(
                      child: Text("证件照样本", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18, 
                        fontWeight: FontWeight.w500)
                      ),)
                    ),
                  Positioned(
                    top: 20, 
                    right: 20, 
                    child: GestureDetector(
                      onTap: (){Navigator.of(context).pop();}, 
                      child: Image.asset("imgs/nav_close.png", width: 16, height: 16,)),)
                ],),
            ),
            
            
            Image.asset("imgs/apply/apply_card_sample.png", width: 209, height: 289,)
          ]
        ),

    
      ),
    );
    showDialog(context: context, builder:(BuildContext context) => materialDialog);
  }


// 营业执照
  void showBusinessDialog(BuildContext context) {
    Dialog materialDialog = Dialog(
      backgroundColor: Color(0xff262931),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)), //this right here
      child: Container(
        height: 376.0,
        width: 301.0,
        child: Column(
          children: <Widget> [
            Container(
              height: 55,
              width: ScreenUtil().screenWidth,
              child: Stack(
                
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned.fill(
                    child: Expanded(
                      child: Text("营业执照样本", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18, 
                        fontWeight: FontWeight.w500)
                      ),)
                    ),
                  Positioned(
                    top: 20, 
                    right: 20, 
                    child: GestureDetector(
                      onTap: (){Navigator.of(context).pop();}, 
                      child: Image.asset("imgs/nav_close.png", width: 16, height: 16,)),)
                ],),
            ),
            
            
            Image.asset("imgs/apply/apply_business_sample.png", width: 209, height: 289,)
          ]
        ),

    
      ),
    );
    showDialog(context: context, builder:(BuildContext context) => materialDialog);
  }


// 资料
void showMaterialDialog(BuildContext context) {


  var items = [
    MaterialItem(
      img: "imgs/apply/apply_blog_sample.png", 
      title: "微博主页截图案例"),
    MaterialItem(
      img: "imgs/apply/apply_headline_sample.png",
      title: "头条主页截图案例"),
  ];
Dialog materialDialog = Dialog(
      backgroundColor: Color(0xff262931),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)), //this right here
      child: Container(
        height: 376.0,
        width: 301.0,
        child: Column(
          children: <Widget> [
            Container(
              height: 55,
              width: ScreenUtil().screenWidth,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned.fill(
                    child: Expanded(
                      child: Text("资质材料样本", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18, 
                        fontWeight: FontWeight.w500)
                      ),)
                    ),
                  Positioned(
                    top: 20, 
                    right: 20, 
                    child: GestureDetector(
                      onTap: (){Navigator.of(context).pop();}, 
                      child: Image.asset("imgs/nav_close.png", width: 16, height: 16,)),)
                ],),
              ),
            
            Container(
              width: 209, 
              height: 320,
              child: new Swiper(
                itemCount: items.length, 
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Color(0xff393c44),
                    activeColor: Color(0xff6d717d)
                  )
                ),
                // control: new SwiperControl(),
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Image.asset(items[index].img),
                      SizedBox(height: 5),
                      Text(
                        items[index].title, 
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff727373)
                        ),),
                    ]
                  );
                },
                ),
              )
          ]
        ),
      ),
    );
    showDialog(context: context, builder:(BuildContext context) => materialDialog);
}


class MaterialItem{
  String img, title;
  MaterialItem({this.img, this.title});
}


// 选择图片
typedef void OnPickImageCallback(ImageSource source);

Future<void> onPressedGetImageButton(BuildContext context, OnPickImageCallback onPick) async {
  
  showModalBottomSheet(
    context: context, 
    builder: (context){
      return Container(
        color: Color(0xff0c0e12),
        height: 145,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xddffffff),
                // height:80,
                width: ScreenUtil().screenWidth,
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: () {
                        onPick(ImageSource.camera);
                        Navigator.of(context).pop();
                      }, 
                      child: Text("拍照", style: TextStyle( color: Colors.blue, fontSize: 16))
                      ),
                    FlatButton(
                      onPressed: ()  {
                        onPick(ImageSource.gallery);
                        Navigator.of(context).pop();
                        }, 
                      child: Text("从相册中选取", style: TextStyle( color: Colors.blue, fontSize: 16))
                      ),
                  ],
                ),
              )
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xddffffff),
                height:40,
                width: ScreenUtil().screenWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        child: Text(
                          "取消", 
                          style: TextStyle(
                            color: Colors.blue, 
                            fontSize: 16))),)
                  ],
                ),
              )
            ),
          ],
        ),
      );
    });
}