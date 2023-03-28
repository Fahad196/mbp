// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mybigplate/Blocs/LoginBloc/login_bloc.dart';
import 'package:mybigplate/Models/resturant_model.dart';

class ResturantRepository {
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2xhcmF2ZWwuYXJ0Y2xpZW50cy5pbi9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3OTg5NDc2MiwiZXhwIjoxNjgwMTEwNzYyLCJuYmYiOjE2Nzk4OTQ3NjIsImp0aSI6IkRxbEMwSHkyMG1rOXlHYmIiLCJzdWIiOiI1IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ViuWIorcFkB66HBBHVZywaau6X8S02zYwAH6priBmk8";
  static const endPoint = "https://laravel.artclients.in/api/auth/resturant";
  Future<List<ResturantModel>> getResturants() async {
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
