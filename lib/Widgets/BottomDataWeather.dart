
import 'package:flutter/material.dart';
class BottomDataWeather extends StatelessWidget {
  String condation_name;
  String condation_number;
   BottomDataWeather({
    required this.condation_name,
    required this.condation_number,
    Key? key

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(condation_name,style: const TextStyle(color: Colors.grey,fontSize: 20),),
        const SizedBox(height: 10,),
        Text(condation_number,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

      ],),
    );
  }
}

