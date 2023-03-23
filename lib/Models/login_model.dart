class LoginModel {
  final String JwtToken;
  final String FirstName;

  const LoginModel({
    required this.JwtToken,
    required this.FirstName,
  });

  Map<String, dynamic> toJson() =>
      {"firstName": FirstName, "JwtToken": JwtToken};

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      JwtToken: json['JwtToken'],
      FirstName: json['firstName'],
    );
  }
}
