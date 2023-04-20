// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_bloc.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_bloc.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_bloc.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_bloc.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_bloc.dart';
import 'package:mybigplate/Blocs/InternetBloc/internet_bloc.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_bloc.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_event.dart';
import 'package:mybigplate/Blocs/LogoutBloc/logout_bloc.dart';
import 'package:mybigplate/Blocs/OrderSummaryBloc/order_summary_bloc.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_bloc.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_bloc.dart';
import 'package:mybigplate/Blocs/TableBloc/table_bloc.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_bloc.dart';
import 'package:mybigplate/Models/login_model.dart';
import 'package:mybigplate/Repositories/cartInfo_repository.dart';
import 'package:mybigplate/Repositories/cart_respository.dart';
import 'package:mybigplate/Repositories/cart_view_repository.dart';
import 'package:mybigplate/Repositories/dasboard_todaydish_repository.dart';
import 'package:mybigplate/Repositories/dashboard_menu_repository.dart';
import 'package:mybigplate/Repositories/delete_cart_repository.dart';
import 'package:mybigplate/Repositories/food_category_repository.dart';
import 'package:mybigplate/Repositories/image_upload_repository.dart';
import 'package:mybigplate/Repositories/login_repository.dart';
import 'package:mybigplate/Repositories/order_now_repository.dart';
import 'package:mybigplate/Repositories/order_summary_repository.dart';
import 'package:mybigplate/Repositories/resturant_repository.dart';
import 'package:mybigplate/Repositories/table_repository.dart';
import 'package:mybigplate/Screens/login_screen.dart';
import 'package:mybigplate/Screens/resturant_screen.dart';
import 'Blocs/DashboardMenuBloc/dashboard_menu_bloc.dart';
import 'Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_bloc.dart';
import 'Blocs/LoginBloc/login_state.dart';
import 'Blocs/OrderDetailsBloc/order_detail_bloc.dart';
import 'Blocs/OrderNowBloc/order_now_bloc.dart';
import 'Repositories/dashboard_hotselling_respository.dart';
import 'Repositories/logout_repository.dart';
import 'Repositories/order_detail_repository.dart';
import 'Repositories/profile_repository.dart';
import 'Repositories/update_quantity_cart_repository.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
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
            BlocProvider(create: (context) => TableBloc(TableRepository())),
            BlocProvider(
                create: (context) => CartInfoBloc(CartInfoRepository())),
            BlocProvider(
                create: (context) =>
                    DashboardHotSellingBloc(DashboardHotSellingRepository())),
            BlocProvider(
                create: (context) =>
                    DashboardTodayDishBloc(DashboardTodayDishRepository())),
            BlocProvider(
                create: (context) =>
                    DashboardMenuBloc(DashboardMenuRepository())),
            BlocProvider(
                create: (context) =>
                    FoodCategoryBloc(FoodCategoryRepository())),
            BlocProvider(create: (context) => CartBloc(CartRespository())),
            BlocProvider(
                create: (context) => CartViewBloc(CartViewRespository())),
            BlocProvider(
                create: (context) => DeleteCartBloc(DeleteCartRepository())),
            BlocProvider(
                create: (context) =>
                    UpdateQuantityCartBloc(UpadteQuantityCartRepository())),
            BlocProvider(create: (context) => ProfileBloc(ProfileRepository())),
            BlocProvider(create: (context) => LogoutBloc(LogoutRepository())),
            BlocProvider(
                create: (context) => OrderNowBloc(OrderNowRepository())),
            BlocProvider(
                create: (context) =>
                    OrderSummaryBloc(OrderSummaryRepository())),
            BlocProvider(
                create: (context) => OrderDetailBloc(OrderDetailRepository())),
            BlocProvider(
                create: (context) => ImageUploadBloc(ImageUploadRepository())),

                 BlocProvider(
                create: (context) => InternetBloc()),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StartPage(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  FlutterSecureStorage s = FlutterSecureStorage();

  String? readToken;
  @override
  void initState() {
    getToken();
    super.initState();
  }

  getToken() async {
    if (await s.containsKey(key: "token")) {
      String? token = await s.read(key: "token");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => ResturantScreen(
                  token: token!,
                )),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(), resizeToAvoidBottomInset: false);
  }
}
