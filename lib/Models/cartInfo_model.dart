// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this
class CartInfoModel {
  final String? message;

  CartInfoModel({this.message});

  factory CartInfoModel.fromJson(Map<String, dynamic> json) {
    return CartInfoModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
