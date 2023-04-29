class LoginModel {
  final String? accessToken;
 final String? tokenType;
 final int? expiresIn;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn,});

 factory LoginModel.fromJson(Map<String, dynamic> json) {
   return LoginModel(
 accessToken : json['access_token'],
    tokenType : json['token_type'],
    expiresIn : json['expires_in'],
   );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}

