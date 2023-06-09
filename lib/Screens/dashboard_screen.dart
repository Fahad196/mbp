// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, unused_local_variable, unused_field, prefer_final_fields, prefer_adjacent_string_concatenation, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_bloc.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_event.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_state.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_bloc.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_event.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_bloc.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_event.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_state.dart';
import 'package:mybigplate/Blocs/InternetBloc/internet_bloc.dart';
import 'package:mybigplate/Blocs/InternetBloc/internet_state.dart';
import 'package:mybigplate/Models/dashboard_hotselling_model.dart';
import 'package:mybigplate/Models/dashboard_menu_model.dart';
import 'package:mybigplate/Models/dashboard_todaydish_model.dart';
import 'package:mybigplate/Screens/food_category_screen.dart';
import 'package:mybigplate/Screens/menu_screen.dart';
import 'package:mybigplate/Screens/product_detail_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';
import 'package:shimmer/shimmer.dart';
import '../Blocs/DashboardMenuBloc/dashboard_menu_state.dart';
import '../Widgets/cart_view_floating_button.dart';

class DashboardScreen extends StatefulWidget {
  int id;
  int index;
  String token;
  DashboardScreen({required this.id, required this.index, required this.token});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    BlocProvider.of<DashboardHotSellingBloc>(context)
        .add(DashboardHotSellingLoadedEvent(widget.id, widget.token));
    BlocProvider.of<DashboardTodayDishBloc>(context)
        .add(DashboardTodayDishLoadedEvent(widget.id, widget.token));
    BlocProvider.of<DashboardMenuBloc>(context)
        .add(DashboardMenuLoadedEvent(widget.id, widget.token));
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, internetState>(
      listener: (context, interState) {
        if (interState is InternetGainedState) {
          Fluttertoast.showToast(
              msg: "Internet connection is back!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: AppColors.textColorWhite,
              fontSize: 16.0);
        } else if (interState is InternetLostState) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                    height: 30.sp,
                    width: 200.sp,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Please check your internet connection!",
                      style: TextStyle(
                          fontFamily: 'met', color: AppColors.textColorWhite),
                    )),
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        body: ListView(
          
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      "assets/banners/banner1.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/banners/banner2.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/banners/banner3.png",
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  width: double.infinity,
                  color: Color.fromARGB(255, 237, 234, 234),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            text: " Today's",
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
                ),
                SizedBox(
                  height: 10.sp,
                ),
                todayDishes(context),
                SizedBox(
                  height: 10.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      width: double.infinity,
                      color: Color.fromARGB(255, 237, 234, 234),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: " Hot",
                                  style: TextStyle(
                                      fontFamily: 'met',
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
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
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 16.sp
                                              : 20.sp,
                                      color: AppColors.lightOrange,
                                      fontWeight: FontWeight.w800),
                                ),
                              ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    hotSellings(context),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                discoverOurMenu(widget.index),
              ],
            ),
          ],
        ),
        floatingActionButton: CartViewFloatingButtonWidget(
            index: widget.index, resturantId: widget.id, token: widget.token),
      ),
    );
  }

//-----------------------------------------Discover Our Menu------------------------------------
  BlocBuilder<DashboardMenuBloc, DashboardMenuState> discoverOurMenu(
      int index) {
    return BlocBuilder<DashboardMenuBloc, DashboardMenuState>(
        builder: (context, state) {
      if (state is DashboardMenuErrorState) {
        return Text("somthing went wrong");
      } else if (state is DashboardMenuLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.darkOrange,
          ),
        );
      } else if (state is DashboardMenuLoadedstate) {
        List<DashboardMenuModel> menu = state.menu;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
              width: double.infinity,
              color: Color.fromARGB(255, 237, 234, 234),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: " Discover Our",
                          style: TextStyle(
                            color: AppColors.textColorBlack,
                            fontFamily: 'met',
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenSizes.isMeduimScreen(context)
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
                            fontSize: ScreenSizes.isMeduimScreen(context)
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
                            builder: (context) => MenuScreen(
                              dashboardMenuModel: menu,
                              categoryName: menu[index].categoryName.toString(),
                              token: widget.token,
                            ),
                          ));
                    },
                    child: Shimmer.fromColors(
                      baseColor: AppColors.textColorBlack,
                      highlightColor: AppColors.dividerColor,
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontFamily: 'met',
                            fontSize: 10.sp,
                            color: AppColors.textColorBlack),
                      ),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          ScreenSizes.isMeduimScreen(context) ? 3 : 2,
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
                                    color:
                                        AppColors.lightOrange.withOpacity(.5),
                                    offset: Offset(2, 2),
                                    blurRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "http://laravel.artclients.in/storage/app/public/" +
                                                "${menu[index].imgPath}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.sp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(menu[index].categoryName.toString(),
                                          style: TextStyle(
                                              color: AppColors.textColorBlack,
                                              fontFamily: 'met',
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 9.sp
                                                      : 15.sp,
                                              fontWeight: FontWeight.w800)),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      FoodCategoryScreen(
                                                        categoryId:
                                                            menu[index].id,
                                                        categoryName:
                                                            menu[index]
                                                                .categoryName
                                                                .toString(),
                                                        resId: widget.id,
                                                        index: widget.index,
                                                        token: widget.token,
                                                      )));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.darkOrange,
                                              border: Border.all(
                                                  color: AppColors.darkOrange)),
                                          child: Text(
                                            "View all",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenSizes.isMeduimScreen(
                                                            context)
                                                        ? 8.sp
                                                        : 11.sp,
                                                color: AppColors.textColorWhite,
                                                fontFamily: 'met'),
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
                                builder: (context) => FoodCategoryScreen(
                                  categoryId: menu[index].id,
                                  categoryName:
                                      menu[index].categoryName.toString(),
                                  resId: widget.id,
                                  index: widget.index,
                                  token: widget.token,
                                ),
                              ));
                        },
                      );
                    },
                    itemCount: menu.length,
                  )),
            )
          ],
        );
      }
      return Container();
    });
  }

//------------------------------------------- HotSellings ------------------------------------------------
  SizedBox hotSellings(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: ScreenSizes.isMeduimScreen(context) ? 110.sp : 141.sp,
      child: BlocBuilder<DashboardHotSellingBloc, DashboardHotSellingState>(
          builder: (context, state) {
        if (state is DashboardHotSellingErrorState) {
          return Text("something went wrong");
        } else if (state is DashboardHotSellingLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.darkOrange,
            ),
          );
        } else if (state is DashboardHotSellingLoadedstate) {
          List<DashboardHotSellingModel> hotSellings = state.hotSellingList;
          return ListView.builder(
              itemCount: hotSellings.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            name: hotSellings[widget.index].itemName.toString(),
                            fullPrice:
                                hotSellings[widget.index].fullPrice.toString(),
                            description:
                                hotSellings[widget.index].itemDesp.toString(),
                            halfPrice:
                                hotSellings[widget.index].halfPrice.toString(),
                            index: index,
                            categoryId: hotSellings[index].categoryId,
                            resturantId: hotSellings[index].resturantId,
                            products: hotSellings,
                            token: widget.token,
                          ),
                        ));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.sp, horizontal: 10.sp),
                    child: Container(
                      width:
                          ScreenSizes.isMeduimScreen(context) ? 90.sp : 140.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
                              blurRadius: 6,
                              spreadRadius: 0,
                              color: AppColors.lightOrange.withOpacity(.5)),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.sp),
                                topRight: Radius.circular(6.sp)),
                            child: Image.network(
                              "http://laravel.artclients.in/storage/app/public/" +
                                  "${hotSellings[index].itemImage}",
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 80.sp
                                  : 100.sp,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.greenAccent,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Image not found',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 3,
                                  child: Text(
                                      hotSellings[index].itemName.toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColors.textColorBlack,
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 7.sp
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
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: AppColors.darkOrange,
                                  ),
                                  height: ScreenSizes.isMeduimScreen(context)
                                      ? 15.sp
                                      : 20.sp,
                                  width: ScreenSizes.isMeduimScreen(context)
                                      ? 30.sp
                                      : 50.sp,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('4.5',
                                          style: TextStyle(
                                            color: AppColors.textColorWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                ScreenSizes.isMeduimScreen(
                                                        context)
                                                    ? 7.sp
                                                    : 11.sp,
                                          )),
                                      Icon(
                                        Icons.star,
                                        color: AppColors.textColorWhite,
                                        size:
                                            ScreenSizes.isMeduimScreen(context)
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
              });
        }
        return Container();
      }),
    );
  }

//--------------------------------------------TodayDishes-------------------------------------------------
  SizedBox todayDishes(BuildContext context) {
    return SizedBox(
      height: ScreenSizes.isMeduimScreen(context) ? 100.sp : 120.sp,
      child: BlocBuilder<DashboardTodayDishBloc, DashboardTodayDishState>(
          builder: (context, state) {
        if (state is DashboardTodayDishErrorState) {
          return Text("Something went error");
        } else if (state is DashboardTodayDishLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.darkOrange,
            ),
          );
        } else if (state is DashboardTodayDishLoadedstate) {
          List<DashboardTodayDishModel> todayDish = state.todayDish;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          fullPrice: todayDish[index].fullPrice.toString(),
                          description: todayDish[index].itemDesp.toString(),
                          name: todayDish[index].itemName.toString(),
                          halfPrice: todayDish[index].halfPrice.toString(),
                          index: index,
                          resturantId: todayDish[index].resturantId,
                          categoryId: todayDish[index].categoryId,
                          products: todayDish,
                          token: widget.token,
                        ),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Container(
                    width: ScreenSizes.isMeduimScreen(context) ? 90.sp : 140.sp,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.5),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 6,
                            spreadRadius: 0,
                            color: AppColors.lightOrange.withOpacity(.5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(6.sp),topRight: Radius.circular(6.sp)),
                            child: Image.network(
                                "http://laravel.artclients.in/storage/app/public/" +
                                    "${todayDish[index].itemImage}",
                                    height: ScreenSizes.isMeduimScreen(context)
                            ? 80.sp
                            : 100.sp,
                            width:double.infinity,
                          fit: BoxFit.fitWidth
                                    )),
                        SizedBox(
                          height: 3.sp,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.only(left: 3.sp),
                            child: Text(
                              todayDish[index].itemName.toString(),
                              style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 7.sp
                                    : 13.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
    );
  }
}
