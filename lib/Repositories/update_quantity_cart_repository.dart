// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/update_quantity_cart_model.dart';

class UpadteQuantityCartRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/updateitem";
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  Future<UpdateQuantityCartModel> updateQuantity(int cartId, int itemPrice,
      int itemQuantity, int resturantId, String portion, String token) async {
    Uri uri = Uri.parse(endPoint);
    log('Item quantity from repository on sending: $itemQuantity');
    var response = await http.put(
      uri,
      headers: {
        "Content-Type": "application/json ; charset=UTF-8",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(
        {
          "cartid": cartId,
          "item_price": itemPrice,
          "item_quantity": itemQuantity,
          "resturant_id": resturantId,
          "portion": portion
        },
      ),
    );
    // log("jsonResponse ${response.body}");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var d = UpdateQuantityCartModel.fromJson(jsonResponse);
      // log("d::::::$d");
      return d;
    } else {
      throw Exception("somthing went wrong");
    }
  }
}
