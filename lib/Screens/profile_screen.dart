// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: AppColors.darkOrange,
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
              height: ScreenSizes.isMeduimScreen(context) ? 20.sp : 30.sp,
            ),
            CircleAvatar(
              radius: ScreenSizes.isMeduimScreen(context) ? 40.sp : 60.sp,
              //foregroundImage:AssetImage(""),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
              padding: EdgeInsets.all(10.sp),
              height: 300.sp,
              decoration: BoxDecoration(
                  color: AppColors.textColorWhite,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 3,
                        color: AppColors.dividerColor.withOpacity(.4))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Full Name",
                      style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 15.sp,
                          color: AppColors.dividerColor)),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Jhon wick",
                      style: TextStyle(
                        fontFamily: 'met',
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 17.sp,
                      )),
                  Divider(
                    color: AppColors.darkOrange,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Designation",
                      style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 15.sp,
                          color: AppColors.dividerColor)),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Babayaga",
                      style: TextStyle(
                        fontFamily: 'met',
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 17.sp,
                      )),
                  Divider(
                    color: AppColors.darkOrange,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Email",
                      style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 15.sp,
                          color: AppColors.dividerColor)),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text("Jhonwick@gmail.com",
                      style: TextStyle(
                        fontFamily: 'met',
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 17.sp,
                      )),
                  Divider(
                    color: AppColors.darkOrange,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(onPressed: () {}, child: Text("Home",style: TextStyle(fontFamily: 'met',fontSize: ScreenSizes.isMeduimScreen(context)?9.sp:15.sp),),
             style: ElevatedButton.styleFrom(
              fixedSize: Size(ScreenSizes.isMeduimScreen(context)?60.sp:100.sp,ScreenSizes.isMeduimScreen(context)?20.sp:35.sp ),
                      padding: EdgeInsets.all( ScreenSizes.isMeduimScreen(context)?5.sp:9.sp,),
                        backgroundColor: AppColors.darkOrange,

                        shape: RoundedRectangleBorder(
                          
                            borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 20.sp,),
          ],
        ));
  }
}
