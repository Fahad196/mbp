class DashboardHotSellingModel {
 final int? id;
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
      {this.id,
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
      id: json['id'],
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isHalf'] = isHalf;
    data['full_price'] = fullPrice;
    data['half_price'] = halfPrice;
    data['item_image'] = itemImage;
    data['item_name'] = itemName;
    data['item_desp'] = itemDesp;
    data['type'] = type;
    data['time'] = time;
    data['category_id'] = categoryId;
    data['resturant_id'] = resturantId;
    return data;
  }
}
