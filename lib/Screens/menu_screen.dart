// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Models/dashboard_menu_model.dart';
import '../Util/colors.dart';
import 'food_category_screen.dart';

class MenuScreen extends StatelessWidget {
   MenuScreen({super.key, required this.dashboardMenuModel,required this.categoryName,required this.token,});
List<DashboardMenuModel> dashboardMenuModel;
final String categoryName;
final String token;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar:  AppBar(
        title: Text("Menu"),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => FoodCategoryScreen(categoryId: dashboardMenuModel[index].id,categoryName: categoryName,resId:int.parse( dashboardMenuModel[index].resturantId!),token: token ,index: index,)));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightOrange.withOpacity(.5),
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.sp),topRight: Radius.circular(6.sp)),
                        child: Image.network(
                          "http://laravel.artclients.in/storage/app/public/"+ dashboardMenuModel[index].imgPath.toString(),
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           dashboardMenuModel[index].categoryName! ,
                            style: TextStyle(fontFamily: 'met', fontSize: 10.sp),
                          ),
                          InkWell(
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => FoodCategoryScreen(categoryId: dashboardMenuModel[index].id,categoryName: categoryName,resId:int.parse( dashboardMenuModel[index].resturantId!),token: token ,index: index,)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.darkOrange,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    fontFamily: 'met', fontSize: 9.sp,color: AppColors.textColorWhite),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: dashboardMenuModel.length,
        ),
      ),
    );
  }
}
