// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, must_call_super, unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_bloc.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_event.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_state.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_event.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_state.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_bloc.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_state.dart';
import 'package:mybigplate/Models/food_category_model.dart';
import 'package:mybigplate/Models/update_quantity_cart_model.dart';
import 'package:mybigplate/Util/colors.dart';

import '../Util/my_icons.dart';
import '../Util/screen_sizes.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String Price;
  final String description;
  final categoryId;
  final resturantId;
  final List<FoodCategoryModel>? products;
  final int? index;
  ProductDetailScreen(
      {super.key,
      required this.name,
      required this.Price,
      required this.description,
      this.index,
      this.products,
      this.categoryId,
      this.resturantId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  UpdateQuantityCartBloc? updateQuantityCartBloc;
  @override
  void initState() {
    updateQuantityCartBloc = BlocProvider.of<UpdateQuantityCartBloc>(context);
  }

  //int itemQuantity = 0;
  @override
  Widget build(BuildContext context) {
    print("index ${widget.index}");
  
    return Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 3.sp,
              ),
              Container(
                width: 190.sp,
                height: 190.sp,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(21)),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.asset(
                      "assets/pizza/img3.png",
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 15.sp : 25.sp,
                    ),
                  ),
                  SizedBox(
                    width: 2.sp,
                  ),
                  Icon(
                    MyIcons.veg,
                    color: Colors.red,
                    size: ScreenSizes.isMeduimScreen(context) ? 10.sp : 15.sp,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    "4.5",
                    style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 8.sp : 15.sp,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: ScreenSizes.isMeduimScreen(context) ? 8.sp : 15.sp,
                    color: AppColors.lightOrange,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "${widget.Price} Rs", //rate
                    style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 8.sp : 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.sp,
              ),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Spice',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 15.sp,
                          ),
                          children: [
                        TextSpan(
                            text: ' rating',
                            style: TextStyle(
                              color: AppColors.textColorBlack,
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 9.sp
                                  : 15.sp,
                            ))
                      ])),
                  Icon(
                    Icons.star,
                    size: ScreenSizes.isMeduimScreen(context) ? 9.sp : 15.sp,
                    color: AppColors.lightOrange,
                  ),
                  Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      dailogMethod(context);
                    },
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        fontFamily: 'met',
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 7.sp : 13.sp,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkOrange,
                        padding: EdgeInsets.all(
                          ScreenSizes.isMeduimScreen(context) ? 6.sp : 10.sp,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  )
                ],
              ),
              SizedBox(
                height: 5.sp,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.timer,
                    size: ScreenSizes.isMeduimScreen(context) ? 9.sp : 15.sp,
                  ),
                  Text(
                    "20" + " " + "min",
                    style: TextStyle(
                        fontFamily: 'met',
                        fontSize:
                            ScreenSizes.isMeduimScreen(context) ? 8.sp : 14.sp,
                        color: AppColors.dividerColor),
                  ) //time
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: 'met',
                    fontSize:
                        ScreenSizes.isMeduimScreen(context) ? 10.sp : 16.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.description, //Description
                  style: TextStyle(
                      fontFamily: 'met',
                      fontSize:
                          ScreenSizes.isMeduimScreen(context) ? 7.sp : 14.sp,
                      fontWeight: FontWeight.w100,
                      color: AppColors.dividerColor),
                ),
              ),
            ],
          ),
        ));
  }

   dailogMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<UpdateQuantityCartBloc, UpdateQuantityCartState>(
              builder: (context, state) {
            if (state is UpdateQuantityCartErrorState) {
              return Text("somthing went wrong");
            } else if (state is UpdateQuantityCartLoadingState) {
              Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UpdateItemQuantityCartState) {
              List<UpdateQuantityCartModel> updateQuantity = state.quantityList;

              return Dialog(
                child: Container(
                  height: ScreenSizes.isMeduimScreen(context) ? 230.sp : 270.sp,
                  width: ScreenSizes.isMeduimScreen(context) ? 250.sp : 300.sp,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Place your order",
                            style: TextStyle(
                                color: AppColors.lightOrange,
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 16.sp
                                    : 20.sp,
                                fontFamily: 'met'),
                          ),
                          Icon(
                            FontAwesomeIcons.x,
                            color: AppColors.lightOrange,
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      SizedBox(
                        height: ScreenSizes.isMeduimScreen(context)
                            ? 90.sp
                            : 110.sp,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/pizza/img3.png",
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 2.sp,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 9.sp
                                                : 18.sp,
                                      ),
                                    ),
                                    Icon(
                                      MyIcons.veg,
                                      color: Colors.red,
                                      size: ScreenSizes.isMeduimScreen(context)
                                          ? 8.sp
                                          : 14.sp,
                                    ),
                                    SizedBox(
                                      width: 21.sp,
                                    ),
                                    Image.asset(
                                      "assets/images/ratingwob.png",
                                      height:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 20.sp
                                              : 40.sp,
                                      width: ScreenSizes.isMeduimScreen(context)
                                          ? 38.sp
                                          : 60.sp,
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                        width:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 100.sp
                                                : 130.sp,
                                        child: Text(
                                          widget.description,
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 8.sp
                                                      : 12.sp,
                                              fontFamily: 'met',
                                              color: Color.fromARGB(
                                                      255, 84, 82, 82)
                                                  .withOpacity(.9)),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenSizes.isMeduimScreen(context)
                                      ? 3.sp
                                      : 10.sp,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Server 1 | ",
                                      style: TextStyle(
                                          fontFamily: 'met',
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 7.sp
                                              : 12.sp,
                                          color:
                                              Color.fromARGB(255, 133, 128, 128)
                                                  .withOpacity(.9)),
                                    ),
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
                                          fontSize: ScreenSizes.isMeduimScreen(
                                                  context)
                                              ? 7.sp
                                              : 12.sp,
                                          color:
                                              Color.fromARGB(255, 133, 128, 128)
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
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
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
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Half",
                            style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 14.sp,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text("200Rs",
                              style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 14.sp,
                              )),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Container(
                            height: ScreenSizes.isMeduimScreen(context)
                                ? 15.sp
                                : 25.sp,
                            width: ScreenSizes.isMeduimScreen(context)
                                ? 35.sp
                                : 65.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: AppColors.darkOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (updateQuantity[widget.index!]
                                            .itemQuantity! >
                                        0) {
                                      setState(() {
                                        updateQuantity[widget.index!]
                                            .itemQuantity;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: AppColors.textColorWhite,
                                    size: ScreenSizes.isMeduimScreen(context)
                                        ? 8.sp
                                        : 14.sp,
                                  ),
                                ),
                                Text(
                                    updateQuantity[widget.index!]
                                        .itemQuantity
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 8.sp
                                                : 14.sp,
                                        color: AppColors.textColorWhite)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      updateQuantity[widget.index!]
                                          .itemQuantity!;
                                      //log(itemQuantity++);
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: AppColors.textColorWhite,
                                    size: ScreenSizes.isMeduimScreen(context)
                                        ? 8.sp
                                        : 14.sp,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Full",
                            style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 14.sp,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Text("${widget.Price} Rs",
                              style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 14.sp,
                              )),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Container(
                            height: ScreenSizes.isMeduimScreen(context)
                                ? 15.sp
                                : 25.sp,
                            width: ScreenSizes.isMeduimScreen(context)
                                ? 35.sp
                                : 65.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: AppColors.darkOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  FontAwesomeIcons.minus,
                                  color: AppColors.textColorWhite,
                                  size: ScreenSizes.isMeduimScreen(context)
                                      ? 8.sp
                                      : 14.sp,
                                ),
                                Text("0",
                                    style: TextStyle(
                                        fontFamily: 'met',
                                        fontSize:
                                            ScreenSizes.isMeduimScreen(context)
                                                ? 8.sp
                                                : 14.sp,
                                        color: AppColors.textColorWhite)),
                                Icon(
                                  FontAwesomeIcons.plus,
                                  color: AppColors.textColorWhite,
                                  size: ScreenSizes.isMeduimScreen(context)
                                      ? 8.sp
                                      : 14.sp,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height:
                            ScreenSizes.isMeduimScreen(context) ? 8.sp : 13.sp,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                              widget.products![widget.index!].id!,
                              int.parse(
                                  widget.products![widget.index!].fullPrice!),
                              updateQuantity[widget.index!].itemQuantity!,
                              int.parse(
                                  widget.products![widget.index!].categoryId!),
                              int.parse(
                                  widget.products![widget.index!].resturantId!),
                              widget.products![widget.index!].type!,
                              widget.products![widget.index!].isHalf == 0
                                  ? "Half"
                                  : "Full"));
                        },
                        child: Text("Add to cart",
                            style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 13.sp,
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
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28))),
              );
            }
            throw Error().stackTrace.toString();
          }
          );
        });
  }
}
