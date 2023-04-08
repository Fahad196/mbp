// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'dart:developer';

import 'package:mybigplate/Models/order_now_model.dart';
import 'package:mybigplate/Models/profile_model.dart';
import 'package:http/http.dart' as http;

class OrderNowRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/ordernow";
  Future<OrderNowModel> getProfile(String token, int resId,int grandTotal) async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.put(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "resturant_id": resId,
            "grandtotal":grandTotal
            }));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        var d = OrderNowModel.fromJson(jsonResponse);

        return d;
      } else {
        throw Exception("Somthimg went wrong");
      }
    } catch (e) {
      throw e;
    }
  }
}
