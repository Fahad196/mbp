import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/cart_view_model.dart';

class CartViewRespository {
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3OTQ3ODkzNiwiZXhwIjoxNjc5Njk0OTM2LCJuYmYiOjE2Nzk0Nzg5MzYsImp0aSI6ImpaWEhYckhlM2lhcmhhOEYiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.T6jcoetHcmwW_337bsgqVIWdzYL-iZKCOzj3RAjnptQ";
  static const endPoint = "http://laravel.artclients.in/api/auth/viewcartitem";
  Future<List<CartViewModel>> getCartList() async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({"resturant_id": 1}));
          log("response body :::::: ${response.body}");
      if (response.statusCode == 200) {
        final List jsonResponse = jsonDecode(response.body);
        log("json response ::: ${jsonResponse}");
        var d = jsonResponse.map((e) => CartViewModel.fromJson(e)).toList();
        log("d:::::::::${d}");
        return d;
      }else{
        throw Error();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
