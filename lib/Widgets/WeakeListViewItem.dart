import 'package:flutter/material.dart';

import '../Constant.dart';

class WeakListViewItem extends StatelessWidget {
  WeakListViewItem({Key? key,required this.isSelected,required this.degree,required this.day,required this.image,required this.month}) : super(key: key);
  bool isSelected;
  String degree;
  String day;
  String month;
  String image;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSelected?300 : 100,
      width: 160,
      decoration:BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: isSelected?gradient:defulatgradient),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(day,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Colors.white),),
          Text(month,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.grey),),
          Image.asset(image,width: WidthSmallimage,height: HightSmallimage ),
          Text('$degree\u00B0',style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),


        ],
      ),
    );
  }
}
