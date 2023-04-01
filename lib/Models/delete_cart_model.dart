// ignore_for_file: unnecessary_this

class DeleteCartModel {
  int? cartId;
  int? resturantId;
  String? portion;

  DeleteCartModel({this.cartId, this.resturantId, this.portion});

  factory DeleteCartModel.fromJson(Map<String, dynamic> json) {
    return DeleteCartModel(
      cartId: json['cartid'],
      resturantId: json['resturant_id'],
      portion: json['portion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cartid'] = this.cartId;
    data['resturant_id'] = this.resturantId;
    data['portion'] = this.portion;
    return data;
  }
}
