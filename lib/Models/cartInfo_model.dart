
// ignore_for_file: file_names

class CartInfoModel {
  final String? message;

  CartInfoModel({this.message});

  factory CartInfoModel.fromJson(Map<String, dynamic> json) {
    return CartInfoModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
