import 'package:flutter/material.dart';

class BottomDataWeather extends StatelessWidget {
  final String condation_name;
  final String condation_number;
  const BottomDataWeather(
      {required this.condation_name, required this.condation_number, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            condation_name,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            condation_number,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
