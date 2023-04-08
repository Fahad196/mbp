
// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';

class CustomTopBar extends CustomClipper<Path> {
  @override
  getClip(Size size) {
  
    var path = new Path();
    path.lineTo(0, size.height / 2);
    var firstControlPoint = new Offset(size.width / 6, size.height / 3);
    var firstEndPoint = new Offset(size.width / 1, size.height / 3 - 45);
    var secondControlPoint =
    new Offset(size.width - (size.width / 4), size.height / 4 - 30);
    var secondEndPoint = new Offset(size.width/1, size.height / 3 - 45);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
 
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper)
  {
    return true;
  }
}