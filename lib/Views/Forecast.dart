import 'package:flutter/material.dart';

import '../Widgets/BodyForcastScreen.dart';

class forecast extends StatelessWidget {

  const forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyForcastScreen(),
    );
  }
}
