// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:mybigplate/Models/cartInfo_model.dart';
import 'package:http/http.dart' as http;

class CartInfoRepository {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  static const endPoint =
      "https://laravel.artclients.in/api/auth/carttable";
  Future<CartInfoModel> getTableInfo(
      int tableNo, int totalGuest, int resturantId, String token) async {
    Uri uri = Uri.parse(endPoint);
    var response = await http.post(uri,
        headers: {
          "Content-Type": "application/json ; charset=UTF-8",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(
           {
            "table_no": tableNo,
            "totalGuest": totalGuest,
            "resturant_id": resturantId
          }
        ));
        log(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      var d = CartInfoModel.fromJson(jsonResponse);
    
      return d;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
