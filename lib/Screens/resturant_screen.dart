// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_bloc.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_events.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_state.dart';
import 'package:mybigplate/Models/resturant_model.dart';
import 'package:mybigplate/Screens/table_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';
import '../Widgets/top_curve.dart';

class ResturantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      BlocProvider.of<ResturantBloc>(context).add(ResturantLoadEvent());
    return Scaffold(body:
        BlocBuilder<ResturantBloc, ResturantState>(builder: (context, state) {
      if (state is ResturantErrorState) {
        return AlertDialog(
          content: Text("Something went wrong"),
        );
      } else if (state is ResturantLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ResturantLoadedState) {
        List<ResturantModel> resturantList=state.resturants;
     
        return SafeArea(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 380.sp,
                  width: double.infinity,
                  child: ClipPath(
                    clipper: CustomTopBar(),
                    child: Container(color: AppColors.darkOrange),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 24.sp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.sp,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(0),
                  height: ScreenSizes.isMeduimScreen(context) ? 100.sp : 140.sp,
                  width: ScreenSizes.isMeduimScreen(context) ? 100.sp : 140.sp,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Our Resturants",
                  style: TextStyle(
                      color: AppColors.darkOrange,
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 16.sp : 25.sp,
                      fontFamily: 'met'),
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: resturantList.length,
                        
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TableScreen(resturantList[index].resId,index),
                                    
                                  ));
                           
                            },
                            child: Padding(
                              padding: EdgeInsets.all(20.sp),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(30.5),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 255, 218, 159),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(10, 20),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        color: Colors.grey.withOpacity(.2)),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      child: SizedBox(
                                        height:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 60.sp
                                                : 80.sp,
                                        width:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 60.sp
                                                : 80.sp,
                                        child: Image.network( 
                                        
                                       "http://192.168.29.210/"+"${resturantList[index].resturantImagePath.toString()}",
                                          fit: BoxFit.fill,
                                        ),
                                     
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    Text(resturantList[index].resturantName ?? "somthing went wrong",
                                    
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'met',
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 10.sp
                                              : 15.sp,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                          
                        })),
              ],
            )
          ],
        ));
      } else {
        return Container();
      }
    }));
  }
}
