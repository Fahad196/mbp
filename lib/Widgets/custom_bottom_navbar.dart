// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomsBottomBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color =  Color.fromRGBO(255, 157, 5, 10);
    Path path = Path()..moveTo(0, 51);
    path.quadraticBezierTo(size.width * 0.26, 0, size.width * 0.52, 0);
    path.quadraticBezierTo(size.width * .71, 0, size.width, 45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
