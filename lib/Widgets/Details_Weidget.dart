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
          Image.asset(
            image,
            width: WidthVerySmallImage,
            height: HightVerySmallImage,
          ),
          Text(
            number,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
