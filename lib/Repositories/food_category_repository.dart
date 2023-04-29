import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/food_category_model.dart';

class FoodCategoryRepository {
  static const endpoint = "http://laravel.artclients.in/api/auth/fooditem";
  Future<List<FoodCategoryModel>> getCatogories(
    int resId,
    int catId,
    String token
  ) async {
   // log("resId $resId  CatId $catId");
    // String token =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
    Uri uri = Uri.parse(endpoint);
    try {
      var response = await http.post(uri,
          headers: {
            "Content-Type": "application/json ; charset=UTF-8",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: json.encode({"category_id": catId, "resturant_id": resId}));
      //  log("response body ::::::::::::: ${response.body}");
      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);
      //  log("json Response ::::::::::::::$jsonResponse ");
        var d = jsonResponse.map((e) => FoodCategoryModel.fromJson(e)).toList();
      //  log("D:::::::::::::::::$d");
        return d;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
    //  log("error::::::::::: $e");
      throw e.toString();
    }
  }
}
