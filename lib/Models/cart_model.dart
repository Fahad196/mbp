// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this
class CartModel {
  final String? message;

  CartModel({this.message});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
