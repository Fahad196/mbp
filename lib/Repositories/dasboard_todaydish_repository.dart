import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/dashboard_todaydish_model.dart';

class DashboardTodayDishRepository {
  static const endpoint = "http://laravel.artclients.in/api/auth/todaydish";
  Future<List<DashboardTodayDishModel>> getTodayDish(int id,String token) async {
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
          body: json.encode({"resturant_id": id}));

      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);

        var d = jsonResponse
            .map((e) => DashboardTodayDishModel.fromJson(e))
            .toList();

        return d;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
