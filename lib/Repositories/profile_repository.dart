// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'dart:developer';

import 'package:mybigplate/Models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  static const endPoint = "http://laravel.artclients.in/api/auth/profile";
  Future<List<ProfileModel>> getProfile(String token) async {
    
    Uri uri = Uri.parse(endPoint);
    try {
      var response = await http.get(uri, headers: {
        "Content-Type": "application/json ; charset=UTF-8",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });

      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body);
       
        var d = jsonResponse.map((e) => ProfileModel.fromJson(e)).toList();
    
        return d;

      } else {
        throw Exception("Somthimg went wrong");
      }
    } catch (e) {
      log(e.toString());
      throw e;
      
    }
  }
}
