// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, unused_local_variable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_bloc.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_event.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_state.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_bloc.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_event.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_bloc.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_event.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_state.dart';
import 'package:mybigplate/Models/dashboard_hotselling_model.dart';
import 'package:mybigplate/Models/dashboard_menu_model.dart';
import 'package:mybigplate/Models/dashboard_todaydish_model.dart';
import 'package:mybigplate/Screens/cart_screen.dart';
import 'package:mybigplate/Screens/food_category_screen.dart';
import 'package:mybigplate/Screens/login_screen.dart';
import 'package:mybigplate/Screens/menu_screen.dart';
import 'package:mybigplate/Screens/order_deatail_screen.dart';
import 'package:mybigplate/Screens/order_summary_screen.dart';
import 'package:mybigplate/Screens/product_detail_screen.dart';
import 'package:mybigplate/Screens/profile_screen.dart';
import 'package:mybigplate/Screens/recommendation_screen.dart';
import 'package:mybigplate/Screens/tranfer_orders_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

import '../Blocs/DashboardMenuBloc/dashboard_menu_state.dart';

class DashboardScreen extends StatefulWidget {
  int id;
  int index;
  DashboardScreen({required this.id, required this.index});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  DashboardScreen get widget => super.widget;
  @override
  void initState() {
    BlocProvider.of<DashboardHotSellingBloc>(context)
        .add(DashboardHotSellingLoadedEvent(widget.id));
    BlocProvider.of<DashboardTodayDishBloc>(context)
        .add(DashboardTodayDishLoadedEvent(widget.id));
    BlocProvider.of<DashboardMenuBloc>(context)
        .add(DashboardMenuLoadedEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        builder: (context) => OrderSummaryScreen()));
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
                        builder: (context) => TranferOrderScreen()));
              },
              child: Text(
                " Tranfer Orders",
                style: TextStyle(
                    fontFamily: 'met',
                    fontSize:
                        ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Expanded(child: SizedBox()),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        fontFamily: 'met',
                        color: AppColors.textColorWhite,
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 15.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.darkOrange,
                  ),
                )),
            SizedBox(
              height: 20.sp,
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.sp,
            ),
            ImageSlideshow(
              indicatorColor: Colors.orange,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              height: 198.sp,
              initialPage: 0,
              indicatorRadius: 5,
              autoPlayInterval: 6000,
              isLoop: true,
              children: [
                Image.asset(
                  "assets/banner_image1.png",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/banner_image1.png",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/banner_image1.png",
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.12,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                          text: TextSpan(
                              text: " Today\'s",
                              style: TextStyle(
                                  color: AppColors.textColorBlack,
                                  fontFamily: 'met',
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 16.sp
                                      : 20.sp),
                              children: [
                            TextSpan(
                              text: " Dishes",
                              style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontFamily: 'met',
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 16.sp
                                      : 20.sp),
                            )
                          ])),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    SizedBox(
                      height:
                          ScreenSizes.isMeduimScreen(context) ? 90.sp : 120.sp,
                      child: BlocBuilder<DashboardTodayDishBloc,
                          DashboardTodayDishState>(builder: (context, state) {
                        if (state is DashboardTodayDishErrorState) {
                          return Text("Something went error");
                        } else if (state is DashboardTodayDishLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DashboardTodayDishLoadedstate) {
                          List<DashboardTodayDishModel> todayDish =
                              state.hotSellingList;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                          Price: todayDish[index]
                                              .fullPrice
                                              .toString(),
                                          description: todayDish[index]
                                              .itemDesp
                                              .toString(),
                                          name: todayDish[index]
                                              .itemName
                                              .toString(),
                                        ),
                                      ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15.sp),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 80.sp
                                              : 100.sp,
                                          child: Image.asset(
                                              "assets/barbique.png")),
                                      Text(
                                        todayDish[index].itemName.toString(),
                                        style: TextStyle(
                                          fontFamily: 'met',
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 8.sp
                                              : 13.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: todayDish.length,
                          );
                        } else {
                          return Text("Somthing went wrong");
                        }
                      }),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    BlocBuilder<DashboardHotSellingBloc,
                        DashboardHotSellingState>(builder: (context, state) {
                      if (state is DashboardHotSellingErrorState) {
                        return Text("something went wrong");
                      } else if (state is DashboardHotSellingLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is DashboardHotSellingLoadedstate) {
                        List<DashboardHotSellingModel> hotSellings =
                            state.hotSellingList;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: " Hot",
                                        style: TextStyle(
                                            fontFamily: 'met',
                                            fontSize:
                                                ScreenSizes.isMeduimScreen(
                                                        context)
                                                    ? 16.sp
                                                    : 20.sp,
                                            color: AppColors.textColorBlack,
                                            fontWeight: FontWeight.w800),
                                        children: [
                                      TextSpan(
                                        text: " Sellings",
                                        style: TextStyle(
                                            fontFamily: 'met',
                                            fontSize:
                                                ScreenSizes.isMeduimScreen(
                                                        context)
                                                    ? 16.sp
                                                    : 20.sp,
                                            color: AppColors.lightOrange,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ])),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RecommondationScreen()));
                                  },
                                  child: Text(
                                    "View all ",
                                    style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 10.sp
                                                : 15.sp,
                                        color: AppColors.dividerColor,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 125.sp
                                  : 141.sp,
                              child: ListView.builder(
                                  itemCount: hotSellings.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetailScreen(name: hotSellings[widget.index].itemName.toString(), Price: hotSellings[widget.index].fullPrice.toString(), description: hotSellings[widget.index].itemDesp.toString(),),));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.sp, horizontal: 10.sp),
                                        child: Container(
                                          width: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 90.sp
                                              : 140.sp,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(2, 2),
                                                  blurRadius: 6,
                                                  spreadRadius: 0,
                                                  color: AppColors.lightOrange
                                                      .withOpacity(.5)),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/barbique.png",
                                                height:
                                                    ScreenSizes.isMeduimScreen(
                                                            context)
                                                        ? 80.sp
                                                        : 100.sp,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    color: Colors.greenAccent,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'Image not found',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  );
                                                },
                                              ),
                                              // Spacer(),
                                              SizedBox(
                                                height: 5.sp,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      flex: 3,
                                                      child: Text(
                                                          hotSellings[index]
                                                              .itemName
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .textColorBlack,
                                                            fontFamily: 'met',
                                                            fontSize: ScreenSizes
                                                                    .isMeduimScreen(
                                                                        context)
                                                                ? 8.sp
                                                                : 13.sp,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 3.sp,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        color: AppColors
                                                            .darkOrange,
                                                      ),
                                                      height: ScreenSizes
                                                              .isMeduimScreen(
                                                                  context)
                                                          ? 15.sp
                                                          : 20.sp,
                                                      width: ScreenSizes
                                                              .isMeduimScreen(
                                                                  context)
                                                          ? 30.sp
                                                          : 50.sp,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text('4.5',
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .textColorWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: ScreenSizes
                                                                        .isMeduimScreen(
                                                                            context)
                                                                    ? 7.sp
                                                                    : 11.sp,
                                                              )),
                                                          Icon(
                                                            Icons.star,
                                                            color: AppColors
                                                                .textColorWhite,
                                                            size: ScreenSizes
                                                                    .isMeduimScreen(
                                                                        context)
                                                                ? 8.sp
                                                                : 11.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          child: Text("Something went wrong"),
                        );
                      }
                    }),
                    SizedBox(
                      height: 5.sp,
                    ),
                    BlocBuilder<DashboardMenuBloc, DashboardMenuState>(
                        builder: (context, state) {
                      if (state is DashboardMenuErrorState) {
                        return Text("somthing went wrong");
                      } else if (state is DashboardMenuLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is DashboardMenuLoadedstate) {
                        List<DashboardMenuModel> menu = state.hotSellingList;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 8, bottom: 8, right: 8),
                              width: double.infinity,
                              color: Color.fromARGB(255, 237, 234, 234),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: " Discover Our",
                                          style: TextStyle(
                                            color: AppColors.textColorBlack,
                                            fontFamily: 'met',
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ScreenSizes.isMeduimScreen(
                                                        context)
                                                    ? 16.sp
                                                    : 20.sp,
                                          ),
                                          children: [
                                        TextSpan(
                                          text: " Menu",
                                          style: TextStyle(
                                            color: AppColors.lightOrange,
                                            fontFamily: 'met',
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ScreenSizes.isMeduimScreen(
                                                        context)
                                                    ? 16.sp
                                                    : 20.sp,
                                          ),
                                        )
                                      ])),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MenuScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontFamily: 'met',
                                          fontSize: 10.sp,
                                          color: Color.fromARGB(
                                              255, 150, 146, 146)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 150.sp,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: ScreenSizes.isMeduimScreen(context)?3:2,
                                    crossAxisSpacing: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.sp, horizontal: 5.sp),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.lightOrange
                                                      .withOpacity(.5),
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            children: [
                                              Flexible(
                                                fit: FlexFit.tight,
                                                flex: 1,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/pizza/img3.png"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(4.sp),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        menu[index]
                                                            .categoryName
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .lightOrange,
                                                            fontFamily: 'met',
                                                            fontSize: ScreenSizes
                                                                    .isMeduimScreen(
                                                                        context)
                                                                ? 9.sp
                                                                : 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800)),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    FoodCategoryScreen(
                                                                      categoryId:
                                                                          menu[index]
                                                                              .id,
                                                                      categoryName: menu[
                                                                              index]
                                                                          .categoryName
                                                                          .toString(),
                                                                      resId:
                                                                          widget
                                                                              .id,
                                                                      index: widget
                                                                          .index,
                                                                    )));
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: AppColors
                                                                .darkOrange,
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .darkOrange)),
                                                        child: Text(
                                                          "View all",
                                                          style: TextStyle(
                                                              fontSize: ScreenSizes
                                                                      .isMeduimScreen(
                                                                          context)
                                                                  ? 9.sp
                                                                  : 11.sp,
                                                              color: AppColors
                                                                  .textColorWhite,
                                                              fontFamily:
                                                                  'met'),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FoodCategoryScreen(
                                                categoryId: menu[index].id,
                                                categoryName: menu[index]
                                                    .categoryName
                                                    .toString(),
                                                resId: widget.id,
                                                index: widget.index,
                                              ),
                                            ));
                                      },
                                    );
                                  },
                                  itemCount: menu.length,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text("somthing went wrong");
                      }
                    })
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 93,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: " Cart",
                    icon: Icons.shopping_basket,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ));
                    }),
                IconBottomBar(
                    text: "Orders",
                    icon: Icons.shopping_cart_rounded,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailScreen(),
                          ));
                    }),
                IconBottomBar(
                    text: "My Profile",
                    icon: Icons.person,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 35,
              color: selected ? AppColors.darkOrange : AppColors.dividerColor),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'met',
              color: selected ? AppColors.darkOrange : AppColors.dividerColor),
        )
      ],
    );
  }
}