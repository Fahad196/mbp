// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, must_call_super, unrelated_type_equality_checks, prefer_adjacent_string_concatenation

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_bloc.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_event.dart';
import 'package:mybigplate/Util/colors.dart';
import '../Util/my_icons.dart';
import '../Util/screen_sizes.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String fullPrice;
  final String halfPrice;
  final String description;
  final categoryId;
  final resturantId;
  final List products;
  final int? index;
  final String token;
  ProductDetailScreen(
      {super.key,
      required this.name,
      required this.fullPrice,
      required this.halfPrice,
      required this.description,
      this.index,
      required this.products,
      this.categoryId,
      this.resturantId,
      required this.token});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  CartBloc? cartBloc;
  int fullItemQuantity = 0;
  int halfItemQuantity = 0;
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 190.sp,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(21)),
              child: Image.network(
                "http://laravel.artclients.in/storage/app/public/" +
                    widget.products[widget.index!].itemImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 13.sp
                              : 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.sp,
                      ),
                      widget.products[widget.index!].type == "Non-Veg"
                          ? Icon(
                              MyIcons.veg,
                              color: Colors.red,
                              size: ScreenSizes.isMeduimScreen(context)
                                  ? 10.sp
                                  : 15.sp,
                            )
                          : Icon(
                              MyIcons.veg,
                              color: Colors.green,
                              size: ScreenSizes.isMeduimScreen(context)
                                  ? 10.sp
                                  : 15.sp,
                            ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 15.sp,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size:
                            ScreenSizes.isMeduimScreen(context) ? 8.sp : 15.sp,
                        color: AppColors.lightOrange,
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "${widget.fullPrice} Rs ", //rate
                        style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 8.sp
                              : 15.sp,
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
                        size:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 15.sp,
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
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 6.sp
                                : 13.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.darkOrange,
                            padding: EdgeInsets.all(
                              ScreenSizes.isMeduimScreen(context)
                                  ? 6.sp
                                  : 10.sp,
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
                        size:
                            ScreenSizes.isMeduimScreen(context) ? 9.sp : 15.sp,
                      ),
                      Text(
                        " ${widget.products[widget.index!].time}" + " " + "min",
                        style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 8.sp
                                : 14.sp,
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
                  SizedBox(height: 3.sp,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.description, //Description
                      style: TextStyle(
                          fontFamily: 'met',
                          fontSize: ScreenSizes.isMeduimScreen(context)
                              ? 7.sp
                              : 14.sp,
                          fontWeight: FontWeight.w100,
                          color: AppColors.dividerColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  dailogMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                height: ScreenSizes.isMeduimScreen(context) ? 230.sp : 292.sp,
                width: ScreenSizes.isMeduimScreen(context) ? 250.sp : 300.sp,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8,bottom: 8),
                      child: Text(
                        "Place your order",
                        style: TextStyle(
                            color: AppColors.lightOrange,
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 16.sp
                                : 20.sp,
                            fontFamily: 'met'),
                      ),
                    ),
                   
                    Image.network(
                      "http://laravel.artclients.in/storage/app/public/" +
                          widget.products[widget.index!].itemImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100.sp,
                    ),
                    SizedBox(height: 1.sp,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                         
                          Row(
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 9.sp
                                      : 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              widget.products[widget.index!].type=="Non-Veg"?
                              Icon(
                                MyIcons.veg,
                                color: Colors.red,
                                size: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 14.sp,
                              ): Icon(
                                MyIcons.veg,
                                color: Colors.green,
                                size: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 14.sp,
                              )
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
                                "${widget.products[widget.index!].time} min",
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
                          widget.halfPrice != null &&
                                  widget.products[widget.index!].isHalf == "1"
                              ? halfQuantityMethod(context, setState)
                              : SizedBox(),
                          SizedBox(
                            height: 10.sp,
                          ),
                          fullQuantityMethod(context, setState),
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

  fullQuantityMethod(BuildContext context, StateSetter setState) {
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
        Text("${widget.fullPrice} Rs ",
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
                      widget.products[widget.index!].id!,
                      int.parse(widget.products[widget.index!].fullPrice!),
                      fullItemQuantity,
                      int.parse(widget.products[widget.index!].categoryId!),
                      int.parse(widget.products[widget.index!].resturantId!),
                      widget.products[widget.index!].type!,
                      'Full',
                      widget.token));
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

  halfQuantityMethod(BuildContext context, StateSetter setState) {
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
        Text("${widget.halfPrice} Rs",
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
                      widget.products[widget.index!].id!,
                      int.parse(widget.products[widget.index!].halfPrice!),
                      halfItemQuantity,
                      int.parse(widget.products[widget.index!].categoryId!),
                      int.parse(widget.products[widget.index!].resturantId!),
                      widget.products[widget.index!].type!,
                      "Half",
                      widget.token));
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
