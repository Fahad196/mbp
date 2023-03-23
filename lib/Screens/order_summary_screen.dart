// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Screens/order_deatail_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Summary "),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height:ScreenSizes.isMeduimScreen(context)?70.sp:110.sp,
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: AppColors.textColorWhite, boxShadow: [
                BoxShadow(
                    color: AppColors.lightOrange.withOpacity(0.7),
                    offset: Offset(1, 2),
                    blurRadius: 4)
              ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Order no 1",
                            style:
                                TextStyle(fontFamily: 'met', fontSize: ScreenSizes.isMeduimScreen(context)?9.sp:15.sp,)),
                        Text("Table no 4",
                            style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)?8.sp:14.sp,
                                color: Color.fromARGB(255, 113, 111, 111)))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetailScreen(),
                            ));
                      },
                      child: Text("Order Detail",
                          style: TextStyle(fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)?9.sp:13.sp,
                          )),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ));
  }
}
