class UpdateQuantityCartModel {
  final int? itemId;
  final int? itemPrice;
   final int? itemQuantity;
  final int? resturantId;
  final String? portion;

  UpdateQuantityCartModel(
      {this.itemId,
      this.itemPrice,
      this.itemQuantity,
      this.resturantId,
      this.portion});

  factory UpdateQuantityCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateQuantityCartModel(
      itemId: json['item_id'],
      itemPrice: json['item_price'],
      itemQuantity: json['item_quantity'],
      resturantId: json['resturant_id'],
      portion: json['portion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_price'] = this.itemPrice;
    data['item_quantity'] = this.itemQuantity;
    data['resturant_id'] = this.resturantId;
    data['portion'] = this.portion;
    return data;
  }
}
