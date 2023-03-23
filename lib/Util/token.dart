import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mybigplate/Repositories/login_repository.dart';

class SaveToken {
  var storage = FlutterSecureStorage();
  var repo = LoginRepository();

  void saveToken(String key,String value) async {
    var data = repo.LogingIn("email", "password");
    storage.write(key: key, value: value);
    
  }
}
