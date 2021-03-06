
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ApplyItemWidget extends StatelessWidget {


  final ApplyItemModel item;
  final Function(ApplyItemModel) onTapItem;
  ApplyItemWidget({Key key, @required this.item, this.onTapItem});


  @override
  Widget build(BuildContext context) {

    var holder = "imgs/apply/apply_card_front.png";
    var tip = "上传材料";
    switch (item.type) {
      case ApplyItemType.cardFront:
        holder = "imgs/apply/apply_card_front.png";
        tip = "上传证件人像面";
        break;
      case ApplyItemType.cardBack:
        holder = "imgs/apply/apply_card_back.png";
        tip = "上传证件国徽面";
        break;
      case ApplyItemType.material:
        holder = "imgs/apply/apply_material.png";
        break;
      case ApplyItemType.businessLicense:
        holder = "imgs/apply/apply_material.png";
        break;
    }

    return GestureDetector(
      onTap: (){
        this.onTapItem(item);
      },
      child: 
    ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: Color(0xff1b1d24),
        // padding: EdgeInsets.all(10),
        child:Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset( holder, width: 80, height: 53,fit: BoxFit.fill,),
                    SizedBox(height: 2),
                    Text(tip, style: TextStyle(fontSize: 12, color: Color(0xff727373)),)
                  ],
                )
              )
            ),
            Positioned.fill(
              child: item.file == null 
              ? Padding(padding: EdgeInsets.all(10), child: Image.asset("imgs/apply/apply_image_border.png", fit: BoxFit.fill,)) 
              : Image.file(File(item.file.path), fit: BoxFit.fill,)),
          ],)
      ),
    ));
  }
}


class ApplyItemModel  {
  String imv;
  ApplyItemType type;
  PickedFile file;
  ApplyItemModel({ this.imv, this.type, this.file});
}

enum ApplyItemType {
  cardFront,
  cardBack,
  businessLicense,
  material,
}