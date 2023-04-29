// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/OrderSummaryBloc/order_summary_bloc.dart';
import 'package:mybigplate/Blocs/OrderSummaryBloc/order_summary_event.dart';
import 'package:mybigplate/Blocs/OrderSummaryBloc/order_summary_state.dart';
import 'package:mybigplate/Models/order_summary_model.dart';
import 'package:mybigplate/Screens/order_deatail_screen.dart';
import 'package:mybigplate/Screens/profile_screen.dart';
import 'package:mybigplate/Screens/resturant_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

import '../Blocs/LogoutBloc/logout_bloc.dart';
import '../Blocs/LogoutBloc/logout_event.dart';
import '../Blocs/LogoutBloc/logout_state.dart';
import 'login_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String token;

  const OrderSummaryScreen({super.key, required this.token,});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderSummaryBloc>(context)
        .add(OrderSummaryLoadedEvent(token));
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResturantScreen(
                                token: token,
                              )),
                      (route) => false);
                },
                child: Text(
                  " Home",
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize: ScreenSizes.isMeduimScreen(context)
                          ? 10.sp
                          : 15.sp),
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
              Align(
                  alignment: Alignment.center,
                  child: BlocListener<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      if (state is LogedoutState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LogoutBloc>(context)
                            .add(LogedoutEvent(token));
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
                    ),
                  )),
              SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
            builder: (context, state) {
          if (state is OrderSummaryErrorState) {
            return Text("Something went wrong");
          } else if (state is OrderSummaryLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.darkOrange,
              ),
            );
          } else if (state is OrderSummaryLoadedState) {
            List<OrderSummaryModel> orderSummary = state.orders;
            return ListView.builder(
              itemBuilder: (context, index) {
                return orderSummary.isNotEmpty
                    ? Container(
                        height: ScreenSizes.isMeduimScreen(context)
                            ? 70.sp
                            : 110.sp,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.textColorWhite,
                            boxShadow: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Order no : ${orderSummary[index].id}",
                                      style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 9.sp
                                                : 15.sp,
                                      )),
                                  Text(
                                      "Table no : ${orderSummary[index].tableNo}",
                                      style: TextStyle(
                                          fontFamily: 'met',
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 8.sp
                                              : 14.sp,
                                          color: Color.fromARGB(
                                              255, 113, 111, 111))),
                                  Text(
                                      "Resturant : ${orderSummary[index].resturantName}",
                                      style: TextStyle(
                                          fontFamily: 'met',
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 8.sp
                                              : 14.sp,
                                          color: Colors.green))
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderDetailScreen(
                                          orderId: orderSummary[index].id,
                                          token: token,
                                          grandTotal: int.parse(
                                              orderSummary[index].grandtotal!),
                                        ),
                                      ));
                                },
                                child: Text("Order Detail",
                                    style: TextStyle(
                                      fontFamily: 'met',
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 7.sp
                                              : 13.sp,
                                    )),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.darkOrange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Text("You have ordered nothing yet"),
                      );
              },
              itemCount: orderSummary.length,
            );
          }
          return Container();
        }));
  }
}
