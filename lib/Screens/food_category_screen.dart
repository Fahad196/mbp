// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_event.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_state.dart';
import 'package:mybigplate/Blocs/InternetBloc/internet_bloc.dart';
import 'package:mybigplate/Blocs/InternetBloc/internet_state.dart';
import 'package:mybigplate/Models/food_category_model.dart';
import 'package:mybigplate/Screens/product_detail_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';
import '../Blocs/CartBloc/cart_event.dart';
import '../Util/my_icons.dart';

class FoodCategoryScreen extends StatefulWidget {
  final int? categoryId;
  final String? categoryName;
  final int? resId;
  final int? index;
  final String? token;
  FoodCategoryScreen(
      {this.categoryId, this.categoryName, this.resId, this.index, this.token});

  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
}

class _FoodCategoryScreenState extends State<FoodCategoryScreen> {
  int halfItemQuantity = 0;
  int fullItemQuantity = 0;
  CartBloc? cartBloc;
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FoodCategoryBloc>(context).add(FoodCategoryLoadedEvent(
        widget.resId!, widget.categoryId!, widget.token!));
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
                              fontFamily: 'met',
                              color: AppColors.textColorWhite),
                        )),
                  );
                },
              );
            }
      },
      child: Scaffold(
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
                child: CircularProgressIndicator(
                  color: AppColors.darkOrange,
                ),
              );
            } else if (state is FoodCategoryLoadedstate) {
              List<FoodCategoryModel> categoryList = state.hotSellingList;
              return SafeArea(
                  child: Column(
                children: [
                  ImageSlideshow(
                    width: double.infinity,
                    height: 200.sp,
                    initialPage: 0,
                    indicatorRadius: 5,
                    indicatorColor: AppColors.lightOrange,
                    indicatorBackgroundColor: AppColors.dividerColor,
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
                    autoPlayInterval: 3000,
                    isLoop: true,
                  ),
                  SizedBox(
                    height: 8.sp,
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
                      widget.categoryName.toString(),
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
                                      builder: (_) => ProductDetailScreen(
                                            fullPrice: categoryList[index]
                                                .fullPrice
                                                .toString(),
                                            description: categoryList[index]
                                                .itemDesp
                                                .toString(),
                                            name: categoryList[index]
                                                .itemName
                                                .toString(),
                                            index: index,
                                            categoryId:
                                                categoryList[index].categoryId,
                                            resturantId:
                                                categoryList[index].resturantId,
                                            products: categoryList,
                                            halfPrice: categoryList[index]
                                                .halfPrice
                                                .toString(),
                                            token: widget.token.toString(),
                                          )));
                             
                            },
                            child: Container(
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 80.sp
                                  : 110.sp,
                              margin: EdgeInsets.all(6.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.textColorWhite,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.lightOrange
                                            .withOpacity(.3),
                                        offset: Offset(1, 3),
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ]),
                              child: Row(
                                children: [
                                  Image.network(
                                      "http://laravel.artclients.in/storage/app/public/" +
                                          categoryList[index]
                                              .itemImage
                                              .toString()),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 8,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.sp),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                categoryList[index]
                                                    .itemName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: ScreenSizes
                                                            .isMeduimScreen(
                                                                context)
                                                        ? 8.sp
                                                        : 15.sp,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'met'),
                                              ),
                                              SizedBox(
                                                width: 3.sp,
                                              ),
                                              categoryList[index].type ==
                                                      "Non-Veg"
                                                  ? Icon(
                                                      MyIcons.veg,
                                                      color: Colors.red,
                                                      size: ScreenSizes
                                                              .isMeduimScreen(
                                                                  context)
                                                          ? 9.sp
                                                          : 12.sp,
                                                    )
                                                  : Icon(
                                                      MyIcons.veg,
                                                      color: Colors.green,
                                                      size: ScreenSizes
                                                              .isMeduimScreen(
                                                                  context)
                                                          ? 9.sp
                                                          : 12.sp,
                                                    )
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView(
                                              children: [
                                                SizedBox(
                                                  width: 200.sp,
                                                  height: ScreenSizes
                                                          .isMeduimScreen(
                                                              context)
                                                      ? 40.sp
                                                      : 50.sp,
                                                  child: Text(
                                                    categoryList[index]
                                                        .itemDesp
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: ScreenSizes
                                                                .isMeduimScreen(
                                                                    context)
                                                            ? 6.sp
                                                            : 10.sp,
                                                        color: AppColors
                                                            .dividerColor,
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
                                                size:
                                                    ScreenSizes.isMeduimScreen(
                                                            context)
                                                        ? 8.sp
                                                        : 12.sp,
                                                color: AppColors.textColorBlack,
                                              ),
                                              Text(
                                                " ${categoryList[index].time} min",
                                                style: TextStyle(
                                                    fontSize: ScreenSizes
                                                            .isMeduimScreen(
                                                                context)
                                                        ? 5.5.sp
                                                        : 10.sp,
                                                    fontFamily: 'met',
                                                    color:
                                                        AppColors.dividerColor),
                                              ),
                                              SizedBox(
                                                width: 10.sp,
                                              ),
                                              Text(
                                                "Rating : ",
                                                style: TextStyle(
                                                    fontSize: ScreenSizes
                                                            .isMeduimScreen(
                                                                context)
                                                        ? 5.5.sp
                                                        : 10.sp,
                                                    fontFamily: 'met',
                                                    color:
                                                        AppColors.dividerColor),
                                              ),
                                              Text(
                                                "4.5",
                                                style: TextStyle(
                                                    fontSize: ScreenSizes
                                                            .isMeduimScreen(
                                                                context)
                                                        ? 5.5.sp
                                                        : 10.sp,
                                                    fontFamily: 'met',
                                                    color:
                                                        AppColors.dividerColor),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size:
                                                    ScreenSizes.isMeduimScreen(
                                                            context)
                                                        ? 8.sp
                                                        : 12.sp,
                                                color: AppColors.textColorBlack,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${categoryList[index].fullPrice.toString()}Rs ",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 7.sp
                                                      : 12.sp,
                                              fontFamily: 'met',
                                              color: AppColors.textColorBlack),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            dialogMethod(
                                                context, categoryList, index);
                                          },
                                          child: Text(
                                            "Add to cart",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenSizes.isMeduimScreen(
                                                            context)
                                                        ? 7.sp
                                                        : 10.sp,
                                                fontFamily: 'met',
                                                color:
                                                    AppColors.textColorWhite),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              shadowColor: AppColors.darkOrange,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              padding: EdgeInsets.all(3.sp),
                                              backgroundColor:
                                                  AppColors.darkOrange),
                                        )
                                      ],
                                    ),
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
          })),
    );
  }

  Future<dynamic> dialogMethod(
      BuildContext context, List<FoodCategoryModel> categoryList, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: StatefulBuilder(builder: (context, setState) {
              return SizedBox(
                height: ScreenSizes.isMeduimScreen(context) ? 235.sp : 290.sp,
                width: ScreenSizes.isMeduimScreen(context) ? 250.sp : 300.sp,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            "Place your order",
                            style: TextStyle(
                                color: AppColors.lightOrange,
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 16.sp
                                    : 20.sp,
                                fontFamily: 'met'),
                          ),
                          Expanded(child: SizedBox()),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                decoration: BoxDecoration(border: Border.all()),
                                child: Icon(FontAwesomeIcons.xmark)),
                          ),
                          SizedBox(
                            width: 12.sp,
                          )
                        ],
                      ),
                    ),
                    Image.network(
                      "http://laravel.artclients.in/storage/app/public/" +
                          categoryList[index].itemImage.toString(),
                      fit: BoxFit.cover,
                      height: 100.sp,
                      width: double.infinity,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                categoryList[index].itemName.toString(),
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 9.sp
                                      : 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Icon(
                                MyIcons.veg,
                                color: Colors.red,
                                size: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSizes.isMeduimScreen(context)
                                ? 8.sp
                                : 10.sp,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Color.fromARGB(255, 133, 128, 128)
                                    .withOpacity(.9),
                                size: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 11.sp,
                              ),
                              Text(
                                "30 min",
                                style: TextStyle(
                                    fontFamily: 'met',
                                    fontSize:
                                        ScreenSizes.isMeduimScreen(context)
                                            ? 7.sp
                                            : 12.sp,
                                    color: Color.fromARGB(255, 133, 128, 128)
                                        .withOpacity(.9)),
                              ),
                              SizedBox(
                                width: ScreenSizes.isMeduimScreen(context)
                                    ? 10.sp
                                    : 3.sp,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 7.sp
                                      : 13.sp,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.lightOrange,
                                size: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 13.sp,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          categoryList[index].halfPrice != null &&
                                  categoryList[index].isHalf == "1"
                              ? halfQuantityMethod(
                                  context, categoryList, index, setState)
                              : SizedBox(),
                          SizedBox(
                            height: 10.sp,
                          ),
                          fullQuantityMethod(
                              context, categoryList, index, setState),
                          SizedBox(
                            height: ScreenSizes.isMeduimScreen(context)
                                ? 8.sp
                                : 13.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28))),
          );
        });
  }

  Row fullQuantityMethod(BuildContext context,
      List<FoodCategoryModel> categoryList, int index, StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Full",
          style: TextStyle(
            fontFamily: 'met',
            fontSize: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
          ),
        ),
        Expanded(child: SizedBox()),
        Text("${categoryList[index].fullPrice} Rs",
            style: TextStyle(
              fontFamily: 'met',
              fontSize: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
            )),
        SizedBox(
          width: 5.sp,
        ),
        Container(
          height: ScreenSizes.isMeduimScreen(context) ? 15.sp : 25.sp,
          width: ScreenSizes.isMeduimScreen(context) ? 35.sp : 65.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: AppColors.darkOrange),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (fullItemQuantity > 0) {
                      fullItemQuantity--;
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  color: AppColors.textColorWhite,
                  size: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                ),
              ),
              Text(fullItemQuantity.toString(),
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                      color: AppColors.textColorWhite)),
              InkWell(
                onTap: () {
                  setState(() {
                    if (fullItemQuantity <= 10) {
                      fullItemQuantity++;
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.textColorWhite,
                  size: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 20.sp,
          ),
        ),
        fullItemQuantity == 0
            ? Expanded(child: Container())
            : ElevatedButton(
                onPressed: () {
                  cartBloc!.add(AddToCartEvent(
                      categoryList[index].id!,
                      int.parse(categoryList[index].fullPrice!),
                      fullItemQuantity,
                      int.parse(categoryList[index].categoryId!),
                      int.parse(categoryList[index].resturantId!),
                      categoryList[index].type!,
                      "Full",
                      widget.token.toString()));
                  setState(
                    () {
                      if (fullItemQuantity != 0) {
                        fullItemQuantity = 0;
                      }
                    },
                  );

                  Fluttertoast.showToast(
                      msg: "Added Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.dividerColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Text("Add to cart",
                    style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 6.5.sp : 10.sp,
                    )),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(
                      ScreenSizes.isMeduimScreen(context) ? 5.sp : 9.sp,
                    ),
                    backgroundColor: AppColors.darkOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              )
      ],
    );
  }

  Row halfQuantityMethod(BuildContext context,
      List<FoodCategoryModel> categoryList, int index, StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Half",
          style: TextStyle(
            fontFamily: 'met',
            fontSize: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
          ),
        ),
        Expanded(child: SizedBox()),
        Text("${categoryList[index].halfPrice} Rs",
            style: TextStyle(
              fontFamily: 'met',
              fontSize: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
            )),
        SizedBox(
          width: 5.sp,
        ),
        Container(
          height: ScreenSizes.isMeduimScreen(context) ? 15.sp : 25.sp,
          width: ScreenSizes.isMeduimScreen(context) ? 35.sp : 65.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: AppColors.darkOrange),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (halfItemQuantity > 0) {
                    setState(() {
                      halfItemQuantity--;
                    });
                  }
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  color: AppColors.textColorWhite,
                  size: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                ),
              ),
              Text(halfItemQuantity.toString(),
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                      color: AppColors.textColorWhite)),
              InkWell(
                onTap: () {
                  setState(() {
                    halfItemQuantity++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.textColorWhite,
                  size: ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 20.sp,
          ),
        ),
        halfItemQuantity == 0
            ? Expanded(child: Container())
            : ElevatedButton(
                onPressed: () {
                  cartBloc!.add(AddToCartEvent(
                      categoryList[index].id!,
                      int.parse(categoryList[index].halfPrice!),
                      halfItemQuantity,
                      int.parse(categoryList[index].categoryId!),
                      int.parse(categoryList[index].resturantId!),
                      categoryList[index].type!,
                      "Half",
                      widget.token.toString()));

                  setState(
                    () {
                      if (halfItemQuantity != 0) {
                        halfItemQuantity = 0;
                      }
                    },
                  );
                  Fluttertoast.showToast(
                      msg: "Added Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.dividerColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Text("Add to cart",
                    style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 6.5.sp : 13.sp,
                    )),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(
                      ScreenSizes.isMeduimScreen(context) ? 5.sp : 9.sp,
                    ),
                    backgroundColor: AppColors.darkOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              )
      ],
    );
  }
}
