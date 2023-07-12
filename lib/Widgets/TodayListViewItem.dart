import 'package:flutter/material.dart';

import '../Constant.dart';

class TodayListViewItem extends StatelessWidget {
   TodayListViewItem({Key? key,required this.isSelected,required this.degree,required this.hour,required this.image}) : super(key: key);
  bool isSelected;
  String degree;
  String hour;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSelected?200 : 100,
      width: 130,
      decoration:BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: isSelected?gradient:defulatgradient),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$degree\u00B0',style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          Image.asset(image,width: WidthSmallimage,height: HightSmallimage ),
          Text(hour,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Colors.grey),),


        ],
      ),
    );
  }
}
