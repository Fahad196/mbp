// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/update_quantity_cart_model.dart';

class UpadteQuantityCartRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/updateitem";
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3OTg5NDc2MiwiZXhwIjoxNjgwMTEwNzYyLCJuYmYiOjE2Nzk4OTQ3NjIsImp0aSI6IkRxbEMwSHkyMG1rOXlHYmIiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ViuWIorcFkB66HBBHVZywaau6X8S02zYwAH6priBmk8";
  updateQuantity(int itemId, int itemPrice, int itemQuantity, int resturantId,
      String portion) async {
    Uri uri = Uri.parse(endPoint);
    var response = await http.put(uri,
        headers: {
          "Content-Type": "application/json ; charset=UTF-8",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode({
          "item_id": itemId,
          "item_price": itemPrice,
          "item_quantity": itemQuantity,
          "resturant_id": resturantId,
          "portion": portion
        }));
    log(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var d = UpdateQuantityCartModel.fromJson(jsonResponse);
      return d;
    } else {
      throw Exception("somthing went wrong");
    }
  }
}
