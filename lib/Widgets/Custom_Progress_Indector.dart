import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import '../Constant.dart';

class CustomProgressIndicator extends StatefulWidget {
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // Adjust the value to control the rotation speed

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: gradient),
      child: Center(
        child: RotationTransition(
          turns: _controller,
          child: Image.asset(
            'assets/images/Fog.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
