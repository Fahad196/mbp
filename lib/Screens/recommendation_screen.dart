// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Screens/cart_screen.dart';
import 'package:mybigplate/Screens/product_detail_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import '../Util/my_icons.dart';
import '../Util/screen_sizes.dart';

class RecommondationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecommondationScreenState();
}

class RecommondationScreenState extends State<RecommondationScreen> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    var arrItems = [
      'Chicken Tikka ',
      'Butter Chicken',
      'Shahi Paneer',
      'Aloo Paratha',
      'Mutton Pulao',
      'Chicken Biryani',
      'Chicken Momos',
      'Mutton Biryani'
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Recommondation"),
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
                  return InkWell(
                    onTap: (){
                   //   Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailScreen(Price: ,)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.sp),
                      height: ScreenSizes.isMeduimScreen(context)?70.sp:120.sp,
                      decoration: BoxDecoration(
                          color: AppColors.textColorWhite,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.lightOrange.withOpacity(.4),
                                offset: Offset(1, 2),
                                blurRadius: 3,
                                spreadRadius: 2)
                          ]),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            child: Image.asset(
                              "assets/pizza/img4.png",
                              width: ScreenSizes.isMeduimScreen(context)?60.sp:95.sp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: ScreenSizes.isMeduimScreen(context)?39.sp:60.sp,
                                  height:ScreenSizes.isMeduimScreen(context)?9.sp:16.sp,
                                  child:
                                      Image.asset("assets/images/ratingwob.png")),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    arrItems[index],
                                    style: TextStyle(
                                        fontSize: ScreenSizes.isMeduimScreen(context)?8.sp:15.sp,
                                       
                                        fontFamily: 'met'),
                                  ),
                                  SizedBox(
                                    width: 3.sp,
                                  ),
                                  Icon(
                                    MyIcons.veg,
                                    color: Colors.red,
                                    size: ScreenSizes.isMeduimScreen(context)?9.sp:12.sp,
                                  )
                                ],
                              ),
                              Text(
                                "With roasted chicken",
                                style: TextStyle(
                                    fontSize: ScreenSizes.isMeduimScreen(context)?6.sp:12.sp,
                                    color: AppColors.dividerColor,
                                    fontFamily: 'met'),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: ScreenSizes.isMeduimScreen(context)?8.sp:12.sp,
                                    color: AppColors.textColorBlack,
                                  ),
                                  Text(
                                    " 23 min",
                                    style: TextStyle(
                                        fontSize:ScreenSizes.isMeduimScreen(context)?5.5.sp:12.sp,
                                        fontFamily: 'met',
                                        color: AppColors.dividerColor),
                                  ),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  Text(
                                    "Rating : ",
                                    style: TextStyle(
                                        fontSize: ScreenSizes.isMeduimScreen(context)?5.5.sp:12.sp,
                                        fontFamily: 'met',
                                        color: AppColors.dividerColor),
                                  ),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                        fontSize:ScreenSizes.isMeduimScreen(context)?5.5.sp:12.sp,
                                        fontFamily: 'met',
                                        color: AppColors.dividerColor),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size:ScreenSizes.isMeduimScreen(context)?8.sp:12.sp,
                                    color: AppColors.textColorBlack,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "200. Rs",
                                style: TextStyle(
                                    fontSize: ScreenSizes.isMeduimScreen(context)?7.sp:12.sp,
                                    fontFamily: 'met',
                                    color: AppColors.textColorBlack),
                              ),
                              SizedBox(
                                height: ScreenSizes.isMeduimScreen(context)?18.sp:28.sp,
                                width: ScreenSizes.isMeduimScreen(context)?55.sp:75.sp,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => CartScreen(),));
                                  },
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        fontSize: ScreenSizes.isMeduimScreen(context)?6.sp:12.sp,
                                        fontFamily: 'met',
                                        color: AppColors.textColorWhite),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                
                                      shadowColor: AppColors.darkOrange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      padding: EdgeInsets.all(2.sp),
                                      backgroundColor: AppColors.darkOrange),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5.sp,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: arrItems.length,
              ));
            }
         
  }

