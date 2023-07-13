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
    return Container(
      width: 120,
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
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            month,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Image.asset(image, width: WidthSmallimage, height: HightSmallimage),
          Text(
            '$degree\u00B0',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
