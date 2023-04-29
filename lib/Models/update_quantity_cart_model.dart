class UpdateQuantityCartModel {
 final int? quantity;
 final String? message;

  UpdateQuantityCartModel({this.quantity, this.message});

  factory UpdateQuantityCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateQuantityCartModel(
      quantity : json['quantity'],
    message : json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['message'] = message;
    return data;
  }
}