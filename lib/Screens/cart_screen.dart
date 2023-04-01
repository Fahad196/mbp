// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_event.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_state.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_event.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_bloc.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_event.dart';
import 'package:mybigplate/Models/cart_view_model.dart';
import 'package:mybigplate/Screens/order_summary_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/my_icons.dart';
import 'package:mybigplate/Util/screen_sizes.dart';

import '../Blocs/DeleteCartBloc/delete_cart_bloc.dart';

class CartScreen extends StatefulWidget {
  final String token;
  CartScreen(this.token);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartViewBloc>(context)
        .add(CartViewLoadedEvent(widget.token));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
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
        body:
            BlocBuilder<CartViewBloc, CartViewState>(builder: (context, state) {
          if (state is CartViewErrorState) {
            return Text("somthing went wrong");
          } else if (state is CartViewLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.darkOrange,
              ),
            );
          } else if (state is CartViewLoadedState) {
            List<CartViewModel> cartList = state.listOfCartItems;
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                              extentRatio: 0.5,
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  icon: Icons.delete,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                  ),
                                  backgroundColor: Colors.red.withOpacity(0.5),
                                  onPressed: ((context) => {
                                        BlocProvider.of<DeleteCartBloc>(context)
                                            .add(DeleteItemCartEvent(
                                                cartList[index].id!,
                                                int.parse(cartList[index]
                                                    .resturantId!),
                                                cartList[index].portion!,
                                                widget.token))
                                      }),
                                ),
                              ]),
                          child: Container(
                            margin: EdgeInsets.all(7.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.textColorWhite,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.lightOrange.withOpacity(.8),
                                      offset: Offset(1, 2),
                                      blurRadius: 4)
                                ]),
                            height: ScreenSizes.isMeduimScreen(context)
                                ? 80.sp
                                : 130.sp,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/pizza/img3.png',
                                  width: ScreenSizes.isMeduimScreen(context)
                                      ? 80.sp
                                      : 120.sp,
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: ScreenSizes.isMeduimScreen(context)
                                          ? MediaQuery.of(context).size.width *
                                              .70
                                          : MediaQuery.of(context).size.width /
                                              1.7,
                                      child: Row(
                                        children: [
                                          Text(
                                            cartList[index].itemName.toString(),
                                            style: TextStyle(
                                              fontFamily: 'met',
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 10.sp
                                                      : 20.sp,
                                            ),
                                          ),
                                          Icon(
                                            MyIcons.veg,
                                            color: Colors.green,
                                            size: ScreenSizes.isMeduimScreen(
                                                    context)
                                                ? 10.sp
                                                : 16.sp,
                                          ),
                                          Expanded(child: SizedBox()),
                                          Text(
                                            "${cartList[index].itemPrice}Rs",
                                            style: TextStyle(
                                              fontFamily: 'met',
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 8.sp
                                                      : 15.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(255, 19, 18, 18),
                                    ),
                                    SizedBox(
                                      width: ScreenSizes.isMeduimScreen(context)
                                          ? MediaQuery.of(context).size.width *
                                              .70
                                          : MediaQuery.of(context).size.width /
                                              1.7,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: ScreenSizes.isMeduimScreen(
                                                    context)
                                                ? 19.sp
                                                : 28.sp,
                                            width: ScreenSizes.isMeduimScreen(
                                                    context)
                                                ? 45.sp
                                                : 75.sp,
                                            decoration: BoxDecoration(
                                                color: AppColors.darkOrange,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      log(cartList[index]
                                                          .itemQuantity
                                                          .toString());
                                                      var q = int.parse(
                                                          cartList[index]
                                                              .itemQuantity!);
                                                      (q--);
                                                      BlocProvider.of<
                                                                  UpdateQuantityCartBloc>(
                                                              context)
                                                          .add(UpdateItemQuantityCartEvent(
                                                              cartId:
                                                                  cartList[index]
                                                                      .id!,
                                                              itemPrice: int.parse(
                                                                  cartList[
                                                                          index]
                                                                      .itemPrice!),
                                                              itemQuantity: q,
                                                              resturantId: int.parse(
                                                                  cartList[index]
                                                                      .resturantId!),
                                                              portion: cartList[
                                                                      index]
                                                                  .portion!,
                                                              token: widget
                                                                  .token));
                                                      log("q::::::::$q");
                                                    });
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.minus,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                                Text(
                                                  cartList[index].itemQuantity!,
                                                  style: TextStyle(
                                                      fontFamily: 'met',
                                                      fontSize: ScreenSizes
                                                              .isMeduimScreen(
                                                                  context)
                                                          ? 9.sp
                                                          : 18.sp,
                                                      color: AppColors
                                                          .textColorWhite),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      var q = int.parse(
                                                          cartList[index]
                                                              .itemQuantity!);
                                                    q++;
                                                      BlocProvider.of<UpdateQuantityCartBloc>(
                                                              context)
                                                          .add(UpdateItemQuantityCartEvent(
                                                              cartId:
                                                                  cartList[index]
                                                                      .id!,
                                                              itemPrice: int
                                                                  .parse(
                                                                      cartList[index]
                                                                          .itemPrice!),
                                                              itemQuantity: q,
                                                              resturantId:
                                                                  int.parse(cartList[
                                                                          index]
                                                                      .resturantId!),
                                                              portion: cartList[
                                                                      index]
                                                                  .portion
                                                                  .toString(),
                                                              token: widget
                                                                  .token));
                                                    });
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.plus,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Text(
                                            "${cartList[index].itemPriceTotal}Rs",
                                            style: TextStyle(
                                              fontFamily: 'met',
                                              fontSize:
                                                  ScreenSizes.isMeduimScreen(
                                                          context)
                                                      ? 8.sp
                                                      : 15.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: cartList.length,
                    ),
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(left: 7.sp, right: 7.sp, top: 5.sp),
                    height:
                        ScreenSizes.isMeduimScreen(context) ? 70.sp : 130.sp,
                    decoration: BoxDecoration(
                        color: AppColors.textColorWhite,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.elevationColor.withOpacity(.3),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Item total",
                              style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 15.sp,
                              ),
                            ),
                            Text("600Rs",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 7.sp
                                      : 14.sp,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 8.sp
                                      : 15.sp,
                                )),
                            Text("0.7",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 7.sp
                                      : 14.sp,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("To pay",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 8.sp
                                      : 15.sp,
                                )),
                            Text("650Rs",
                                style: TextStyle(
                                  fontFamily: 'met',
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 7.sp
                                      : 14.sp,
                                )),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderSummaryScreen()));
                          },
                          child: Text("Order Now",
                              style: TextStyle(
                                fontFamily: 'met',
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 15.sp,
                              )),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp))),
                        )
                      ],
                    ))
              ],
            );
          } else {
            return Container();
          }
        }));
  }
}
