import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Models/image_upload_model.dart';

class ImageUploadRepository {
  Future uploadImage(String imagePath, String token) async {
    try {
      const endpoint = "http://laravel.artclients.in/api/auth/upload";
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        "Accept": "application/json",
        'X-CSRF-TOKEN': "V0igxBq0DghzfsYpiYdockasiZByK678yggOj5qs",
        "Authorization": "Bearer $token"
      };
      var request = http.MultipartRequest('POST', Uri.parse(endpoint))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', imagePath));

      var streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log("response:::: ${response.toString()}");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  // Future<ImageUploadModel> uploadImage(String token, File imageFile) async {
  //   Uri uri = Uri.parse(endpoint);
  //   try {
  //     var response = await http.post(uri,
  //         headers: {
  //           "Content-Type": "application/json ; charset=UTF-8",
  //           "Accept": "application/json",
  //           "Authorization": "Bearer $token"
  //         },
  //         body: {"image": imageFile});
  //     log("response body ::::::::::::: ${response.body}");
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       log("json Response ::::::::::::::$jsonResponse ");
  //       return jsonResponse;
  //     } else {
  //       throw Exception("No data found");
  //     }
  //   } catch (e) {
  //     //  log("error::::::::::: $e");
  //     throw e.toString();
  //   }
  // }
}
