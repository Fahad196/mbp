// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/resturant_model.dart';

class ResturantRepository {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  static const endPoint = "https://laravel.artclients.in/api/auth/resturant";
  Future<List<ResturantModel>> getResturants(String token) async {
   
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.get(uri, headers: {
        "Content-Type": "application/json ; charset=UTF-8",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
    
      if (response.statusCode == 200) {
        final List jsonResponse = jsonDecode(response.body);
        var d = jsonResponse.map((e) => ResturantModel.fromJson(e)).toList();
        
        return d;
        
      } else {
        throw Exception("Invalid Resturant");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
