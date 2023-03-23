// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_bloc.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_bloc.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_bloc.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_event.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_bloc.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_bloc.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_bloc.dart';
import 'package:mybigplate/Blocs/TableBloc/table_bloc.dart';
import 'package:mybigplate/Repositories/cartInfo_repository.dart';
import 'package:mybigplate/Repositories/cart_respository.dart';
import 'package:mybigplate/Repositories/cart_view_repository.dart';
import 'package:mybigplate/Repositories/dasboard_todaydish_repository.dart';
import 'package:mybigplate/Repositories/dashboard_menu_repository.dart';
import 'package:mybigplate/Repositories/food_category_repository.dart';
import 'package:mybigplate/Repositories/login_repository.dart';
import 'package:mybigplate/Repositories/resturant_repository.dart';
import 'package:mybigplate/Repositories/table_repository.dart';
import 'package:mybigplate/Screens/dashboard_screen.dart';
import 'package:mybigplate/Screens/login_screen.dart';

import 'Blocs/DashboardMenuBloc/dashboard_menu_bloc.dart';
import 'Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_bloc.dart';
import 'Repositories/dashboard_hotselling_respository.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(LoginRepository()),
            ),
            BlocProvider(
                create: (context) => ResturantBloc(ResturantRepository())),
                 BlocProvider(
                create: (context) => TableBloc(TableRepository())),
                BlocProvider(
                create: (context) => CartInfoBloc(CartInfoRepository())),
                 BlocProvider(
                create: (context) => DashboardHotSellingBloc(DashboardHotSellingRepository())),
                BlocProvider(
                create: (context) => DashboardTodayDishBloc(DashboardTodayDishRepository())),
                BlocProvider(
                create: (context) => DashboardMenuBloc(DashboardMenuRepository())),

                     BlocProvider(
                create: (context) => FoodCategoryBloc(FoodCategoryRepository())),
                   BlocProvider(
                create: (context) => CartBloc(CartRespository())),
                 BlocProvider(
                create: (context) => CartViewBloc(CartViewRespository())),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
            debugShowCheckedModeBanner: false,

            // initialRoute: '/',
            // routes: {
            //   '/':(context) => LoginScreen(),
            //   'resturants':(context) => ResturantScreen(),
            //  },
          ),
        );
      },
    );
  }
}
