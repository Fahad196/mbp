// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Screens/feedback_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

class OrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 239, 239),
        appBar: AppBar(
          title: Text("Order Detail"),
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
        body: Column(
          children: [
            SizedBox(
              height: 12.sp,
            ),
            Container(
              margin: EdgeInsets.all(10.sp),
              height: ScreenSizes.isMeduimScreen(context) ? 300.sp : 380.sp,
              decoration: BoxDecoration(
                  color: AppColors.textColorWhite,
                  border:
                      Border.all(color: AppColors.dividerColor.withOpacity(.2)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 5,
                        color: AppColors.elevationColor.withOpacity(.2))
                  ]),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pizza",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 9.sp
                                      : 18.sp,
                                )),
                            Text("83 Rs",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 7.sp
                                      : 14.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity",
                                style: TextStyle(
                                    fontFamily: 'met',
                                    fontSize:
                                        ScreenSizes.isMeduimScreen(context)
                                            ? 7.sp
                                            : 14.sp,
                                    color: Color.fromARGB(255, 118, 116, 116))),
                            Text("3",
                                style: TextStyle(
                                    fontFamily: 'met',
                                    fontSize:
                                        ScreenSizes.isMeduimScreen(context)
                                            ? 7.sp
                                            : 14.sp,
                                    color: Color.fromARGB(255, 118, 116, 116)))
                          ],
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total",
                                style: TextStyle(
                                    fontFamily: 'met',
                                    fontSize:
                                        ScreenSizes.isMeduimScreen(context)
                                            ? 7.sp
                                            : 14.sp,
                                    color: Color.fromARGB(255, 118, 116, 116))),
                            Text("166 Rs",
                                style: TextStyle(
                                    fontFamily: 'met',
                                    fontSize:
                                        ScreenSizes.isMeduimScreen(context)
                                            ? 7.sp
                                            : 14.sp,
                                    color: Color.fromARGB(255, 118, 116, 116)))
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.dividerColor,
                        )
                      ],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              padding: EdgeInsets.all(5.sp),
              decoration:
                  BoxDecoration(color: AppColors.textColorWhite, boxShadow: [
                BoxShadow(
                    color: AppColors.elevationColor.withOpacity(.2),
                    offset: Offset(1, 2),
                    blurRadius: 5)
              ]),
              height: 110.sp,
              margin: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item Total",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 14.sp,
                        ),
                      ),
                      Text(
                        "400 Rs",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 7.sp
                              : 13.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 14.sp,
                        ),
                      ),
                      Text(
                        "0.9",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 7.sp
                              : 13.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fee",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 14.sp,
                        ),
                      ),
                      Text("0",
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 7.sp
                                : 13.sp,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card No",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 14.sp,
                        ),
                      ),
                      Text("*************2623",
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 7.sp
                                : 13.sp,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To pay",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 14.sp,
                        ),
                      ),
                      Text("450 Rs",
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 7.sp
                                : 13.sp,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackScreen(),
                    ));
              },
              child: Text(
                "Feedback",
                style: TextStyle(
                  fontFamily: 'met',
                  fontSize: ScreenSizes.isMeduimScreen(context) ? 7.sp : 14.sp,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(109.sp, 21.sp),
                  backgroundColor: AppColors.darkOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(
              height: 10.sp,
            )
          ],
        ));
  }
}
