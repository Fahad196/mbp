// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  static const endPoint = "https://laravel.artclients.in/api/auth/login";
  //http://192.168.29.210/my-big-plate-api/login

  LogingIn(String email, String password) async {
    try {
      Uri uri = Uri.parse(endPoint);
      var response = await http.post(
        uri,
        headers: {"Content-Type": "application/json ; charset=UTF-8"},
        body: jsonEncode(
          {
          
          "username": email, "password": password
        }),
      );
      
      if (response.statusCode == 200) {
      
        final jsonResponse = jsonDecode(response.body);
   
        return jsonResponse;
      } else {
        print("please register");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
