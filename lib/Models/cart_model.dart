class CartModel {
  int? itemId;
  int? itemPrice;
  int? itemQuantity;
  int? categoryId;
  int? resturantId;
  String? type;
  String? portion;

  CartModel(
      {this.itemId,
      this.itemPrice,
      this.itemQuantity,
      this.categoryId,
      this.resturantId,
      this.type,
      this.portion});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemId: json['item_id'],
      itemPrice: json['item_price'],
      itemQuantity: json['item_quantity'],
      categoryId: json['category_id'],
      resturantId: json['resturant_id'],
      type: json['type'],
      portion: json['portion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_price'] = this.itemPrice;
    data['item_quantity'] = this.itemQuantity;
    data['category_id'] = this.categoryId;
    data['resturant_id'] = this.resturantId;
    data['type'] = this.type;
    data['portion'] = this.portion;
    return data;
  }
}
