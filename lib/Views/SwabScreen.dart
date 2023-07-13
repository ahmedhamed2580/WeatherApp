import 'package:flutter/material.dart';

import 'ForecastScreen.dart';
import 'HomeScreen.dart';

class SwapeScreens extends StatefulWidget {
  const SwapeScreens({Key? key}) : super(key: key);

  @override
  _SwapeScreensState createState() => _SwapeScreensState();
}

class _SwapeScreensState extends State<SwapeScreens> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [HomeScreen(), ForecastScreen()],
      ),
    );
  }
}
