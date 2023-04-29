import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/order_detail_model.dart';

class OrderDetailRepository {
  static const endpoint = "http://laravel.artclients.in/api/auth/orderdetails";
  Future<List<OrderDetailModel>> getCatogories(
      int orderId, String token) async {
    Uri uri = Uri.parse(endpoint);
    try {
      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({"orderid": orderId}));
      //log("response body ::::::::::::: ${response.body}");
      if (response.statusCode == 201) {
        final List jsonResponse = json.decode(response.body);
        //  log("json Response ::::::::::::::$jsonResponse ");
        var d = jsonResponse.map((e) => OrderDetailModel.fromJson(e)).toList();
        // log("D:::::::::::::::::$d");
        return d;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      // log("error::::::::::: $e");
      throw e.toString();
    }
  }
}
