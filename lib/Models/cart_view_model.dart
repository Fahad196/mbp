class CartViewModel {
  final int? id;
 final String? itemName;
 final String? itemImage;
 final String? itemPrice;
 final String? itemPriceTotal;
 final String? itemQuantity;

  CartViewModel(
      {this.id,
      this.itemName,
      this.itemImage,
      this.itemPrice,
      this.itemPriceTotal,
      this.itemQuantity});

 factory CartViewModel.fromJson(Map<String, dynamic> json) {
  return CartViewModel(
  id : json['id'],
    itemName : json['item_name'],
    itemImage :json['item_image'],
    itemPrice : json['item_price'],
    itemPriceTotal : json['item_price_total'],
    itemQuantity : json['item_quantity'],
  );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['item_image'] = this.itemImage;
    data['item_price'] = this.itemPrice;
    data['item_price_total'] = this.itemPriceTotal;
    data['item_quantity'] = this.itemQuantity;
    return data;
  }
}