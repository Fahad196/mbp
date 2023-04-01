// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/cart_model.dart';

class CartRespository {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  static const endPoint = "http://laravel.artclients.in/api/auth/additem";
  Future<CartModel> addToCart(int itemId, int itemPrice, int itemQuantity,
      int categoryId, int resturantId,String type,String portion,String token) async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "item_id": itemId,
            "item_price": itemPrice,
            "item_quantity": itemQuantity,
            "category_id": categoryId,
            "resturant_id": resturantId,
            "type": type,
            "portion": portion
          }));
      log("RESPONSE.BODY:::::::: ${response.body}");
      if (response.statusCode == 200) {
        final  jsonResponse = json.decode(response.body);
        log("JSON RESPONSE:::::::: $jsonResponse");
        var d = CartModel.fromJson(jsonResponse);
        log("d:::::::: ${d}");
        return d;
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      log("respo error:::::::::::::: ${e.toString()}");
      throw e.toString();
    }
  }
}
