import 'package:flutter/material.dart';

import '../Constant.dart';

class WeakListViewItem extends StatelessWidget {
  const WeakListViewItem(
      {Key? key,
      required this.isSelected,
      required this.degree,
      required this.day,
      required this.image,
      required this.month})
      : super(key: key);
  final bool isSelected;
  final String degree;
  final String day;
  final String month;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (screenWidth-(20*3))/4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: isSelected ? gradient : defulatgradient,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            month,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Image.asset(image, width: WidthVerySmallImage, height: HightVerySmallImage),
          Text(
            '$degree\u00B0',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
