import 'package:flutter/material.dart';

import '../Constant.dart';

class TodayListViewItem extends StatelessWidget {
  const TodayListViewItem({Key? key,required this.isSelected,required this.degree,required this.hour,required this.image}) : super(key: key);
  final bool isSelected;
  final String degree;
  final String hour;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (screenWidth-(20*3))/4,
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isSelected?gradient:defulatgradient,
        border: Border.all(color: Colors.grey),

      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$degree\u00B0',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Image.asset(image,width:WidthVerySmallImage ,height: HightVerySmallImage ),
          Text(hour,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.grey),),


        ],
      ),
    );
  }
}
