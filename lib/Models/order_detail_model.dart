class OrderDetailModel {
  final String? type;
  final String? portion;
  final String? itemName;
  final String? itemImage;
  final String? itemPrice;
  final String? itemPriceTotal;
  final String? itemQuantity;
  final String? resturantId;
  final int? id;

  OrderDetailModel(
      {this.type,
      this.portion,
      this.itemName,
      this.itemImage,
      this.itemPrice,
      this.itemPriceTotal,
      this.itemQuantity,
      this.resturantId,
      this.id});

 factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
   return OrderDetailModel(
     type : json['type'],
    portion : json['portion'],
    itemName : json['item_name'],
    itemImage : json['item_image'],
    itemPrice : json['item_price'],
    itemPriceTotal : json['item_price_total'],
    itemQuantity : json['item_quantity'],
    resturantId : json['resturant_id'],
    id : json['id'],
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
    data['resturant_id'] = this.resturantId;
    data['id'] = this.id;
    return data;
  }
}