import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/cart_view_model.dart';

class CartViewRespository {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  static const endPoint = "http://laravel.artclients.in/api/auth/viewcartitem";
  Future<List<CartViewModel>> getCartList(String token, int resId) async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({"resturant_id": resId}));
      if (response.statusCode == 200) {
        final List jsonResponse = jsonDecode(response.body);
        var d = jsonResponse.map((e) => CartViewModel.fromJson(e)).toList();
        return d;
      } else {
        throw Error();
      }
    } catch (e) {
      // print(e);
      throw Exception(e);
    }
  }
}
