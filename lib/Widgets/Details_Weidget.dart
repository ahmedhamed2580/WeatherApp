import 'package:flutter/material.dart';

import '../Constant.dart';

class DetailsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String number;
   const DetailsWidget({
    super.key,
     required this.name,
     required this.number,
     required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(image,width: WidthSmallimage,height: HightSmallimage,),
          Text(number,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text(name,style: const TextStyle(fontSize: 16,color: Colors.grey),),

        ],
      ),
    );
  }
}
