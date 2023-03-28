// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/delete_cart_model.dart';

class DeleteCartRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/deleteitem";
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3OTg5NDc2MiwiZXhwIjoxNjgwMTEwNzYyLCJuYmYiOjE2Nzk4OTQ3NjIsImp0aSI6IkRxbEMwSHkyMG1rOXlHYmIiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ViuWIorcFkB66HBBHVZywaau6X8S02zYwAH6priBmk8";
  deleteCartItems(int itemId, int resturantId, String portion) async {
    Uri uri = Uri.parse(endPoint);
    var response = await http.delete(uri,
        headers: {
          "Content-Type": "application/json ; charset=UTF-8",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode({
          "item_id": itemId,
          "resturant_id": resturantId,
          "portion": portion
        }));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var d = DeleteCartModel.fromJson(jsonResponse);
    }
  }
}
