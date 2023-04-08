// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, sort_child_properties_last, unused_local_variable, no_leading_underscores_for_local_identifiers, deprecated_member_use, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:convert';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_event.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_state.dart';
import 'package:mybigplate/Screens/dashboard_screen.dart';
import 'package:mybigplate/Screens/resturant_screen.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Widgets/custom_bottom_navbar.dart';
import '../Blocs/LoginBloc/login_bloc.dart';
import '../Repositories/login_repository.dart';
import '../Util/screen_sizes.dart';
import '../Widgets/top_curve.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  // void initState() {
  //   getValue();
  // }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isObsecure = true;
  LoginBloc? loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mq = MediaQuery.of(context);

    final msg = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return AlertDialog(
          content: Text(state.message),
        );
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, state) {
          
            if (state is LoginSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantScreen(
                      token: state.token.toString(),
                    ),
                  ));
              Fluttertoast.showToast(
                  msg: "Logged in Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.dividerColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 320.sp,
                    width: double.infinity,
                    child: ClipPath(
                      clipper: CustomTopBar(),
                      child: Container(color: AppColors.darkOrange),
                    )),
              ),
              Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 40.sp,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(0),
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 100.sp
                                  : 140.sp,
                              width: ScreenSizes.isMeduimScreen(context)
                                  ? 100.sp
                                  : 140.sp,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/logo.png'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: ScreenSizes.isMeduimScreen(context)
                                      ? 22.sp
                                      : 33.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'met'),
                            ),
                            SizedBox(
                                height: ScreenSizes.isMeduimScreen(context)
                                    ? 40.sp
                                    : 40.sp),
                            Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(10),
                                width: ScreenSizes.isMeduimScreen(context)
                                    ? 236.sp
                                    : 310.sp,
                                child: Text(
                                  'Employee Id',
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 10.sp
                                              : 15.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'met'),
                                )),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 35.sp
                                  : 52.sp,
                              width: ScreenSizes.isMeduimScreen(context)
                                  ? 250.sp
                                  : 330.sp,
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.lightOrange),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: 'Enter Id',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.length < 4 ||
                                      value.length > 10) {
                                    return "* Required";
                                  } else
                                    return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 15.sp
                                  : 10.sp,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(10),
                                width: ScreenSizes.isMeduimScreen(context)
                                    ? 236.sp
                                    : 310.sp,
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 10.sp
                                              : 15.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'met'),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                height: ScreenSizes.isMeduimScreen(context)
                                    ? 30.sp
                                    : 45.sp,
                                width: ScreenSizes.isMeduimScreen(context)
                                    ? 250.sp
                                    : 330.sp,
                                child: TextFormField(
                                  obscureText: isObsecure == true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon:
                                        Icon(Icons.remove_red_eye_outlined),
                                    icon: Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors.lightOrange),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    labelText: 'Enter Password',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "* Required";
                                    } else
                                      return null;
                                  },
                                )),
                            SizedBox(
                                height: ScreenSizes.isMeduimScreen(context)
                                    ? 30.sp
                                    : 50.sp),
                            SizedBox(
                              height: ScreenSizes.isMeduimScreen(context)
                                  ? 20.sp
                                  : 32.sp,
                              width: ScreenSizes.isMeduimScreen(context)
                                  ? 80.sp
                                  : 110.sp,
                              child: ElevatedButton(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontFamily: 'met',
                                      fontSize:
                                          ScreenSizes.isMeduimScreen(context)
                                              ? 9.sp
                                              : 15.sp,
                                      fontWeight: FontWeight.w100),
                                ),
                                onPressed: () {
                                  var _username = nameController.text;
                                  var _passwd = passwordController.text;

                                  if (_formKey.currentState!.validate()) {
                                    loginBloc!.add(LoginButtonPressedEvent(
                                        _username, _passwd));
                                  } else {
                                    Dialog(
                                      child: Text(
                                          "An Error Occurred \n No account was found matching that username and password"),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(4.sp),
                                  primary: AppColors.darkOrange,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              msg,
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: ScreenSizes.isMeduimScreen(context) ? 75.sp : 93.sp,
            width: double.infinity,
            child: CustomPaint(
              painter: CustomsBottomBar(),
            )),
        resizeToAvoidBottomInset: false);
  }
}
