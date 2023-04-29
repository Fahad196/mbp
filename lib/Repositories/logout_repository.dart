// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mybigplate/Models/logout_model.dart';

class LogoutRepository {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4MDA2NTQ2OCwiZXhwIjoxNjgwMjgxNDY4LCJuYmYiOjE2ODAwNjU0NjgsImp0aSI6IkhJRGtscmVuZk5IUTVnT04iLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D40qxC7iZ0m2NEdwJ5uF76TSnRKuPjt9IBvI91LMjLY";
  static const endPoint = "https://laravel.artclients.in/api/auth/logout";
   Future<LogoutModel> logingOut(String token) async {
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.get(uri, headers: {
        "Content-Type": "application/json ; charset=UTF-8",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      log("response ${response.body} ");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        var d = LogoutModel.fromJson(jsonResponse);
        log(d.toString());
        return d;
        
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
