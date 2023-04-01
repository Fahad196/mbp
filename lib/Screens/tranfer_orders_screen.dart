// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Screens/resturant_screen.dart';

import '../Util/colors.dart';
import '../Util/screen_sizes.dart';
import '../Widgets/custom_bottom_navbar.dart';

class TranferOrderScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transfer Order"),
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
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Enter Credentials",
              style: TextStyle(
                  fontFamily: 'met',
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenSizes.isMeduimScreen(context)?15.sp:25.sp,),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        width: ScreenSizes.isMeduimScreen(context)?235.sp:300.sp,
                        child: Text(
                          'Employee Id',
                          style: TextStyle(
                              fontSize:  ScreenSizes.isMeduimScreen(context)?10.sp:18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'met'),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width:  ScreenSizes.isMeduimScreen(context)?250.sp:320.sp,
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.lightOrange),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
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
                      height: ScreenSizes.isMeduimScreen(context)?20.sp:10.sp,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        width:  ScreenSizes.isMeduimScreen(context)?235.sp:300.sp,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: ScreenSizes.isMeduimScreen(context)?10.sp:18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'met'),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        width:  ScreenSizes.isMeduimScreen(context)?250.sp:320.sp,
                        child: TextFormField(
                          obscureText: isObsecure == true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            icon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.lightOrange),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Enter Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* Required";
                            } else
                              return null;
                          },
                        )),
                  ]),
                )),
                SizedBox(height: 20.sp,),
            ElevatedButton(
              child: Text(
                'Sign In',
                style: TextStyle(
                    fontSize:ScreenSizes.isMeduimScreen(context)?9.sp:18.sp,
                    fontFamily: 'met',
                    fontWeight: FontWeight.w100),
              ),
              onPressed: () {
                var _username = nameController.text;
                var _passwd = passwordController.text;
                if (_formKey.currentState!.validate()) {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ResturantScreen(),
                  //     ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(4.sp),
                fixedSize: Size(ScreenSizes.isMeduimScreen(context)?60.sp:120.sp, ScreenSizes.isMeduimScreen(context)?20.sp:38.sp,),
                primary: AppColors.darkOrange,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 6,
              ),
            )
          ]),
        ),
        bottomNavigationBar:Container(
          height: 60.sp,
          child: CustomPaint(painter: CustomsBottomBar()),
        ) ,
        );
  }
}
