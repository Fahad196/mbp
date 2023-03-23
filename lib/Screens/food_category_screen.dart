// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_event.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_state.dart';
import 'package:mybigplate/Blocs/TableBloc/table_event.dart';
import 'package:mybigplate/Models/food_category_model.dart';
import 'package:mybigplate/Screens/product_detail_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

import '../Util/my_icons.dart';
import 'cart_screen.dart';

class FoodCategoryScreen extends StatelessWidget {
  final int? categoryId;
  final String? categoryName;
  final int? resId;
  final int? index;
  FoodCategoryScreen({this.categoryId, this.categoryName, this.resId, this.index});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FoodCategoryBloc>(context).add(FoodCategoryLoadedEvent(resId!,categoryId!));
    return Scaffold(
        appBar: AppBar(
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
        body: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
            builder: (context, state) {
          if (state is FoodCategoryErrorState) {
            return Text("Error 404");
          } else if (state is FoodCategoryLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FoodCategoryLoadedstate) {
            List<FoodCategoryModel> categoryList = state.hotSellingList;
            return SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: 2.sp,
                ),
                ImageSlideshow(
                  width: double.infinity,
                  height: 200.sp,
                  initialPage: 0,
                  indicatorRadius: 5,
                  indicatorColor: AppColors.lightOrange,
                  indicatorBackgroundColor: AppColors.dividerColor,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/banner_image1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/banner_image1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/banner_image1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(3.sp),
                  decoration: BoxDecoration(
                      color: AppColors.textColorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightOrange.withOpacity(.8),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                        )
                      ]),
                  child: Text(
                    categoryName.toString(),
                    style: TextStyle(
                        fontFamily: 'met',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightOrange),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell( 
                          onTap: () {
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductDetailScreen(Price: categoryList[index].fullPrice.toString(), description: categoryList[index].itemDesp.toString(), name: categoryList[index].itemName.toString(), index: index)));
                          },
                          child: Container(
                            height:ScreenSizes.isMeduimScreen(context)? 80.sp:110.sp,
                            margin: EdgeInsets.all(6.sp),
                            decoration: BoxDecoration(
                                color: AppColors.textColorWhite,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.lightOrange.withOpacity(.3),
                                      offset: Offset(1, 3),
                                      blurRadius: 3,
                                      spreadRadius: 3)
                                ]),
                            child: Row(
                              children: [
                                Image.asset("assets/pizza/img3.png"),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/ratingwob.png",
                                        height: 15.sp,
                                        width: 45.sp,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            categoryList[index]
                                                .itemName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:ScreenSizes.isMeduimScreen(context)? 10.sp:15.sp,
                                                fontWeight: FontWeight.w700,
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
                                      Expanded(
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              width: 200.sp,
                                              height: ScreenSizes.isMeduimScreen(context)?40.sp:50.sp,
                                              child: Text(
                                                categoryList[index].itemDesp.toString(),
                                                style: TextStyle(
                                                    fontSize: ScreenSizes.isMeduimScreen(context)?6.sp:10.sp,
                                                    color: AppColors.dividerColor,
                                                    fontFamily: 'met'),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                fontSize: ScreenSizes.isMeduimScreen(context)?5.5.sp:10.sp,
                                                fontFamily: 'met',
                                                color: AppColors.dividerColor),
                                          ),
                                          SizedBox(
                                            width: 10.sp,
                                          ),
                                          Text(
                                            "Rating : ",
                                            style: TextStyle(
                                                fontSize: ScreenSizes.isMeduimScreen(context)?5.5.sp:10.sp,
                                                fontFamily: 'met',
                                                color: AppColors.dividerColor),
                                          ),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                                fontSize: ScreenSizes.isMeduimScreen(context)?5.5.sp:10.sp,
                                                fontFamily: 'met',
                                                color: AppColors.dividerColor),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: ScreenSizes.isMeduimScreen(context)?8.sp:12.sp,
                                            color: AppColors.textColorBlack,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${categoryList[index].fullPrice.toString()}Rs ",
                                      style: TextStyle(
                                          fontSize:ScreenSizes.isMeduimScreen(context)?7.sp:12.sp,
                                          fontFamily: 'met',
                                          color: AppColors.textColorBlack),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CartScreen(),
                                            ));
                                      },
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            fontSize: ScreenSizes.isMeduimScreen(context)?6.sp:10.sp,
                                            fontFamily: 'met',
                                            color: AppColors.textColorWhite),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          shadowColor: AppColors.darkOrange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(2.sp),
                                          backgroundColor:
                                              AppColors.darkOrange),
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
                      itemCount: categoryList.length,
                    ),
                  ),
                )
              ],
            ));
          } else {
            return Container();
          }
        }));
  }
}
