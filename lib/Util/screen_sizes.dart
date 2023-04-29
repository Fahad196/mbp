// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ScreenSizes extends StatelessWidget {
  final Widget largeScreen;
  final Widget meduimScreen;
  final Widget smallScreen;
  ScreenSizes(Key key, this.largeScreen, this.meduimScreen, this.smallScreen)
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isMeduimScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768 &&
        MediaQuery.of(context).size.width <= 850;
  }

  static bool isLargerScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 850;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return smallScreen;
        } else if (constraints.maxWidth > 786 && constraints.maxWidth <= 850) {
          return meduimScreen;
        }else{
          return largeScreen;
        }
      },
    );
  }
}
