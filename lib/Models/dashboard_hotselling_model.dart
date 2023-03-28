class DashboardHotSellingModel {
 final String? itemId;
 final String? isHalf;
 final String? fullPrice;
 final String? halfPrice;
 final String? itemImage;
 final String? itemName;
final  String? itemDesp;
 final String? type;
 final String? time;
 final String? categoryId;
final  String? resturantId;

  DashboardHotSellingModel(
      {this.itemId,
      this.isHalf,
      this.fullPrice,
      this.halfPrice,
      this.itemImage,
      this.itemName,
      this.itemDesp,
      this.type,
      this.time,
      this.categoryId,
      this.resturantId});

  factory DashboardHotSellingModel.fromJson(Map<String, dynamic> json) {
    return DashboardHotSellingModel(
      itemId: json['item_id'],
      isHalf: json['isHalf'],
      fullPrice: json['full_price'],
      halfPrice: json['half_price'],
      itemImage: json['item_image'],
      itemName: json['item_name'],
      itemDesp: json['item_desp'],
      type: json['type'],
      time: json['time'],
      categoryId: json['category_id'],
      resturantId: json['resturant_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['isHalf'] = this.isHalf;
    data['full_price'] = this.fullPrice;
    data['half_price'] = this.halfPrice;
    data['item_image'] = this.itemImage;
    data['item_name'] = this.itemName;
    data['item_desp'] = this.itemDesp;
    data['type'] = this.type;
    data['time'] = this.time;
    data['category_id'] = this.categoryId;
    data['resturant_id'] = this.resturantId;
    return data;
  }
}
