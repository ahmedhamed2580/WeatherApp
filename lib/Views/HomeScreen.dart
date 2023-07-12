import 'package:flutter/material.dart';

import '../Widgets/BodyHomeScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF081b25),
      body: BodyHomeScreen(),
    );
  }
}
