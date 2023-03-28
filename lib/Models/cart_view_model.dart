// ignore_for_file: unnecessary_this

class CartViewModel {
  String? type;
  String? portion;
  String? itemName;
  String? itemImage;
  String? itemPrice;
  String? itemPriceTotal;
  String? itemQuantity;
  int? itemId;

  CartViewModel(
      {this.type,
      this.portion,
      this.itemName,
      this.itemImage,
      this.itemPrice,
      this.itemPriceTotal,
      this.itemQuantity,
      this.itemId});

  factory CartViewModel.fromJson(Map<String, dynamic> json) {
    return CartViewModel(
      type: json['type'],
      portion: json['portion'],
      itemName: json['item_name'],
      itemImage: json['item_image'],
      itemPrice: json['item_price'],
      itemPriceTotal: json['item_price_total'],
      itemQuantity: json['item_quantity'],
      itemId: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['portion'] = this.portion;
    data['item_name'] = this.itemName;
    data['item_image'] = this.itemImage;
    data['item_price'] = this.itemPrice;
    data['item_price_total'] = this.itemPriceTotal;
    data['item_quantity'] = this.itemQuantity;
    data['id'] = this.itemId;
    return data;
  }
}
