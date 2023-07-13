import 'package:flutter/material.dart';

import '../Widgets/BodyForcastScreen.dart';

class ForecastScreen extends StatelessWidget {

  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyForcastScreen(),
    );
  }
}
