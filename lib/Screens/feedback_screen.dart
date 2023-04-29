// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Util/colors.dart';
import '../Util/screen_sizes.dart';
import '../Widgets/custom_bottom_navbar.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Feedback",
          style: TextStyle(fontFamily: 'met'),
        ),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              SizedBox(
                height: 10.sp,
              ),
              Image.asset(
                "assets/logo_home.png",
                height: ScreenSizes.isMeduimScreen(context)?130.sp:160.sp,
              ),
              Text(
                "Rate Your Exprience",
                style: TextStyle(fontFamily: 'met', fontSize:  ScreenSizes.isMeduimScreen(context)?13.sp:24.sp,),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                "Are you satisfied with the service?",
                style: TextStyle(
                    fontFamily: 'met',
                    fontSize: ScreenSizes.isMeduimScreen(context)?7.5.sp:14.sp,
                    color: AppColors.textColorBlack.withOpacity(.5)),
              ),
              Image.asset(
                "assets/images/ratingwob.png",
                height: 55.sp,
                width: 140.sp,
              ),
              TextFormField(
                maxLength: 200,
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.lightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Tell us how can we improve',
                    labelStyle: TextStyle(fontFamily: 'met'),
                    contentPadding:
                        EdgeInsets.only(bottom: 20.sp, left: 10.sp)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else
                    return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          elevation: 5,
                          backgroundColor: Color.fromARGB(255, 224, 220, 220),
                          content: SizedBox(
                            height: ScreenSizes.isMeduimScreen(context)?110.sp:160.sp,
          

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/thumpup.gif",
                                  height: ScreenSizes.isMeduimScreen(context)?35.sp:54.sp,
                                  width: ScreenSizes.isMeduimScreen(context)?35.sp:54.sp,
                                ),
                                Text(
                                  "Thank You",
                                  style: TextStyle(
                                      fontFamily: 'met', fontSize:ScreenSizes.isMeduimScreen(context)?12.sp:18.sp,),
                                ),
                                SizedBox(
                                  height: ScreenSizes.isMeduimScreen(context)?3.sp:15.sp,
                                ),
                                Text(
                                  "Your feedback was successfully submitted",
                                  style: TextStyle(
                                      fontFamily: 'met', fontSize: ScreenSizes.isMeduimScreen(context)?7.sp:12.sp,),
                                ),
                                Expanded(child: SizedBox()),

                                // InkWell(
                                //   onTap: () => Navigator.pop(context),
                                //   child: Icon(FontAwesomeIcons.x)),
                                InkWell(
                                 // onTap: () => 
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => ResturantScreen(),
                                  //     )),
                                  child: Text(
                                    "Back to home",
                                    style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize: ScreenSizes.isMeduimScreen(context)?9.sp:14.sp,
                                        color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontFamily: 'met', fontSize:  ScreenSizes.isMeduimScreen(context)?8.sp:16.sp,),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size( ScreenSizes.isMeduimScreen(context)?65.sp:110.sp,  ScreenSizes.isMeduimScreen(context)?20.sp:34.sp,)),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90.sp,
        child: CustomPaint(
          painter: CustomsBottomBar(),
        ),
      ),
    );
  }
}
