// ignore_for_file: unused_local_variable, use_rethrow_when_possible

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/delete_cart_model.dart';

class DeleteCartRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/deleteitem";
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  deleteCartItems(int cartId, int resturantId, String portion,String token) async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.delete(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({
            "cartid": cartId,
            "resturant_id": resturantId,
            "portion": portion
          }));
      //log("response body :::::::: ${response.body}");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        //log("jsonResponse :::::::::::::$jsonResponse");
        var d = DeleteCartModel.fromJson(jsonResponse);
      //  log("d :::::::::$d");
        return;
      }
    } catch (e) {
      // print("Error $e");
      throw e;
    }
  }
}
