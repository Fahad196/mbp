class LogoutModel {
  final String? message;

  LogoutModel({this.message});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
