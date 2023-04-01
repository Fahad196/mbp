// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, deprecated_member_use, unnecessary_overrides, unnecessary_brace_in_string_interps, prefer_if_null_operators, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_bloc.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_state.dart';
import 'package:mybigplate/Blocs/TableBloc/table_bloc.dart';
import 'package:mybigplate/Blocs/TableBloc/table_event.dart';
import 'package:mybigplate/Blocs/TableBloc/table_state.dart';
import 'package:mybigplate/Models/table_model.dart';
import 'package:mybigplate/Repositories/table_repository.dart';
import 'package:mybigplate/Screens/dashboard_screen.dart';
import '../Blocs/CartInfoBloc/cartInfo_event.dart';
import '../Util/colors.dart';
import '../Util/screen_sizes.dart';
import '../Widgets/custom_bottom_navbar.dart';
import '../Widgets/top_curve.dart';

class TableScreen extends StatefulWidget {
  int? id;
  int index;
  String token;
  TableScreen(this.id, this.index,this.token);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  TableScreen get widget => super.widget;
  CartInfoBloc? cartInfoBloc;
  @override
  void initState() {
   
    BlocProvider.of<TableBloc>(context).add(TableLoadedEvent(id:widget.id ?? 404, token: widget.token));
    cartInfoBloc = BlocProvider.of<CartInfoBloc>(context);
    super.initState();
  }

   String? dropdownvalue;
  
  final TextEditingController noOfGuest = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<TableBloc, TableState>(builder: (context, state) {
        if (state is TableErrorState) {
          return AlertDialog(
            content: Text("Somthing went wrong"),
          );
        } else if (state is TableLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TableLoadedState) {
          List<TableModel> tableList = state.tables;
       
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
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.sp,
                      ),
                      Center(
                        child: Text(
                          'Book a Table',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 16.sp
                                  : 23.sp,
                              color: AppColors.textColorWhite,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'met'),
                        ),
                      ),
                     
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.textColorWhite,
                          borderRadius: BorderRadius.circular(10.5),
                          border: Border.all(
                            color: AppColors.lightOrange,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(5, 5),
                                blurRadius: 3,
                                spreadRadius: 0,
                                color:
                                    AppColors.elevationColor.withOpacity(.1)),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        height:
                            ScreenSizes.isMeduimScreen(context) ? 35.sp : 50,
                        width:
                            ScreenSizes.isMeduimScreen(context) ? 250.sp : 340,
                        child: Center(
                          child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: ScreenSizes.isMeduimScreen(context)
                                ? 21.sp
                                : 25.sp,
                            elevation: 0,
                            style: TextStyle(
                                color: AppColors.textColorBlack,
                                fontFamily: 'met'),
                            value: dropdownvalue != null ? dropdownvalue : null,
                            hint: Text(
                              'Select Table',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 11.sp
                                      : 15.sp,
                                  color: AppColors.textColorBlack,
                                  fontFamily: 'met'),
                            ),
                            items: tableList.map((list) {
                              
                              return DropdownMenuItem(
                                value: list.id.toString(),
                              
                                child: Text(
                                  'Table No : ${list.tableNo}',
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 11.sp
                                              : 15.sp,
                                      color: AppColors.textColorBlack,
                                      fontFamily: 'met'),
                                ),
                              );
                              
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value.toString();
                              
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height:
                            ScreenSizes.isMeduimScreen(context) ? 35.sp : 50,
                        width:
                            ScreenSizes.isMeduimScreen(context) ? 250.sp : 340,
                        decoration: BoxDecoration(
                          color: AppColors.textColorWhite,
                          borderRadius: BorderRadius.circular(10.5),
                          border: Border.all(
                            color: AppColors.lightOrange,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(5, 5),
                                blurRadius: 3,
                                spreadRadius: 0,
                                color:
                                    AppColors.elevationColor.withOpacity(.1)),
                          ],
                        ),
                        child: TextFormField(
                          controller: noOfGuest,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            labelText: 'Total no of Guest',
                            labelStyle: TextStyle(
                                color: AppColors.textColorBlack.withOpacity(.7),
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenSizes.isMeduimScreen(context)
                                    ? 8.sp
                                    : 11.sp,
                                fontFamily: 'met'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length > 2) {
                              return "The Number Of Guests Should Not Be Greater Than 20!";
                            } else
                              return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text("Somthing went wrong"));
        }
      }),
      bottomNavigationBar: BlocListener<CartInfoBloc, CartInfoState>(
          listener: (context, state) {
            if (state is CartInfoSuccessfulstate) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(id: widget.id!, index:widget.index,token:widget.token),
                  ));

            }
          },
          child: Container(
            height: 93.sp,
            child: CustomPaint(
              painter: CustomsBottomBar(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.chair,
                          size: ScreenSizes.isMeduimScreen(context)
                              ? 14.sp
                              : 20.sp),
                      SizedBox(
                        width: 3.sp,
                      ),
                      Text(
                        "Table No: ${dropdownvalue != null ? dropdownvalue : ""} | ",
                        style: TextStyle(
                            fontFamily: 'met',
                            color: AppColors.textColorWhite,
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 13.sp),
                      ),
                      Text(
                        "Guest: ${noOfGuest.text}",
                        style: TextStyle(
                            fontFamily: 'met',
                            color: AppColors.textColorWhite,
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 13.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  SizedBox(
                    width: ScreenSizes.isMeduimScreen(context) ? 70.sp : 120.sp,
                    height: ScreenSizes.isMeduimScreen(context) ? 20.sp : 33.sp,
                    child: ElevatedButton(
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 12.sp,
                            fontFamily: 'met'),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cartInfoBloc!.add(CartInfoSuccessfulEvent(
                              int.parse(dropdownvalue!),
                              int.parse(noOfGuest.text),
                              int.parse(widget.id.toString()),
                              widget.token
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.textColorWhite,
                        onPrimary: AppColors.lightOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: BorderSide(color: AppColors.darkOrange, width: 0),
                        shadowColor: AppColors.elevationColor,
                        elevation: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
