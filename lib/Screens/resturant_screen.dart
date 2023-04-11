// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last, prefer_adjacent_string_concatenation, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_bloc.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_events.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_state.dart';
import 'package:mybigplate/Models/resturant_model.dart';
import 'package:mybigplate/Screens/profile_screen.dart';
import 'package:mybigplate/Screens/table_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';
import '../Blocs/LogoutBloc/logout_bloc.dart';
import '../Blocs/LogoutBloc/logout_event.dart';
import '../Blocs/LogoutBloc/logout_state.dart';
import 'login_screen.dart';
import 'order_summary_screen.dart';

class ResturantScreen extends StatelessWidget {
  final String token;
  ResturantScreen({
    required this.token,
  });
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ResturantBloc>(context)
        .add(ResturantLoadEvent(token: token.toString()));
    return Scaffold(
        drawer: Drawer(
          width: ScreenSizes.isMeduimScreen(context) ? 130.sp : 150.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ScreenSizes.isMeduimScreen(context) ? 37.2.sp : 70.sp,
                decoration: BoxDecoration(color: AppColors.darkOrange),
              ),
              SizedBox(
                  height: ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSummaryScreen(
                                token: token,
                              )));
                },
                child: Text(
                  " Orders",
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp),
                ),
              ),
              SizedBox(
                  height: ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                token: token,
                              )));
                },
                child: Text(
                  " Profile",
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp),
                ),
              ),
              Expanded(child: SizedBox()),
              BlocListener<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  if (state is LogedoutState) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                   
                    // log(state.props.toString());
                  }
                },
                child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LogoutBloc>(context)
                            .add(LogedoutEvent(token));
                        log(token.toString());
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontFamily: 'met',
                            color: AppColors.textColorWhite,
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 15.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.darkOrange,
                      ),
                    )),
              ),
              SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
        ),
        body: BlocBuilder<ResturantBloc, ResturantState>(
            builder: (context, state) {
          if (state is ResturantLoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.darkOrange,
            ));
          } else if (state is ResturantLoadedState) {
            List<ResturantModel> resturantList = state.resturants;
            return SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Text(
                  "Our Resturants",
                  style: TextStyle(
                      color: AppColors.darkOrange,
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 16.sp : 25.sp,
                      fontFamily: 'met'),
                ),
                SizedBox(
                  height: 30.sp,
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
                                    builder: (context) => TableScreen(
                                        resturantList[index].resId,
                                        index,
                                        token),
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
                                          "http://laravel.artclients.in/storage/app/public/" +
                                              "${resturantList[index].resturantImagePath.toString()}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    Text(
                                        resturantList[index].resturantName ??
                                            "somthing went wrong",
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
            ));
          } else if (state is ResturantErrorState) {
            return AlertDialog(
              content: Text("Something went wrong"),
            );
          }
          return Container();
        }));
  }
}
