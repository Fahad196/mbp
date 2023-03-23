class CartModel {
  final int? itemId;
  final int? itemPrice;
  final int? itemQuantity;
  final int? categoryId;
  final int? resturantId;

  CartModel(
      {this.itemId,
      this.itemPrice,
      this.itemQuantity,
      this.categoryId,
      this.resturantId});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        itemId: json['item_id'],
        itemPrice: json['item_price'],
        itemQuantity: json['item_quantity'],
        categoryId: json['category_id'],
        resturantId: json['resturant_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_price'] = this.itemPrice;
    data['item_quantity'] = this.itemQuantity;
    data['category_id'] = this.categoryId;
    data['resturant_id'] = this.resturantId;
    return data;
  }
}
