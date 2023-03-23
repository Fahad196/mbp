import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/dashboard_hotselling_model.dart';
import 'package:mybigplate/Models/dashboard_todaydish_model.dart';

class DashboardTodayDishRepository {
  static const endpoint = "http://laravel.artclients.in/api/auth/todayDish";
  Future<List<DashboardTodayDishModel>> getTodayDish(int id) async {
     String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3OTQ3ODkzNiwiZXhwIjoxNjc5Njk0OTM2LCJuYmYiOjE2Nzk0Nzg5MzYsImp0aSI6ImpaWEhYckhlM2lhcmhhOEYiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.T6jcoetHcmwW_337bsgqVIWdzYL-iZKCOzj3RAjnptQ";
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
