import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Gradient? gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3FA2FA),
      Color(0xFF955CD1),
    ]);
Gradient? defulatgradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF081b25),
      Color(0xFF081b25),
    ]);
void scrollToCurrentState(
    int index, ItemScrollController ItemScrollController) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ItemScrollController.jumpTo(
      index: DateTime.now().hour,
    );
  });
}

const double WidthSmallimage = 64;
const double HightSmallimage = 64;
const double HightVerySmallImage = 32;
const double WidthVerySmallImage = 32;
