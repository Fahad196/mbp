class UpdateQuantityCartModel {
 final int? cartid;
 final int? itemPrice;
 final int? itemQuantity;
 final int? resturantId;
 final String? portion;

  UpdateQuantityCartModel(
      {this.cartid,
      this.itemPrice,
      this.itemQuantity,
      this.resturantId,
      this.portion});

  factory UpdateQuantityCartModel.fromJson(Map<String, dynamic> json) {
   return UpdateQuantityCartModel(
     cartid : json['cartid'],
    itemPrice : json['item_price'],
    itemQuantity : json['item_quantity'],
    resturantId : json['resturant_id'],
    portion : json['portion'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartid'] = this.cartid;
    data['item_price'] = this.itemPrice;
    data['item_quantity'] = this.itemQuantity;
    data['resturant_id'] = this.resturantId;
    data['portion'] = this.portion;
    return data;
  }
}