// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/cart_screen.dart';
import '../Util/colors.dart';

class CartViewFloatingButtonWidget extends StatelessWidget {
  const CartViewFloatingButtonWidget(
      {super.key, required this.index, required this.resturantId, required this.token});

  final String token;
  final int index;
  final int resturantId;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.sp,
      width: 33.sp,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(token, index, resturantId),
              ));
        },
        backgroundColor: AppColors.darkOrange,
        child: Icon(
          Icons.shopping_cart,
          size: 15.sp,
          
        ),
      ),
    );
  }
}
