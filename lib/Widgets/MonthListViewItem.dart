import 'package:flutter/material.dart';

import '../Constant.dart';

class MonthListViewItem extends StatelessWidget {
  final String day;
  final String maxtemp;
  final String mintemp;
  final String image;

  const MonthListViewItem(
      {Key? key,
      required this.day,
      required this.maxtemp,
      required this.mintemp,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            day,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            overflow: TextOverflow.clip,
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text(
                '$maxtemp\u00B0',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '$mintemp\u00B0',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
            child: Image.asset(image,
                width: WidthVerySmallImage, height: HightVerySmallImage)),
      ],
    );
  }
}
