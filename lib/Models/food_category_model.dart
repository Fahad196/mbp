class FoodCategoryModel {
  final int? id;
  final String? itemName;
  final String? fullPrice;
  final String? halfPrice;
  final String? itemImage;
  final String? itemDesp;
  final String? categoryId;
  final String? resturantId;
  final String? isHalf;
  final String? type;
  final String? time;

  FoodCategoryModel(
      {this.id,
      this.itemName,
      this.fullPrice,
      this.halfPrice,
      this.itemImage,
      this.itemDesp,
      this.categoryId,
      this.resturantId,
      this.isHalf,
      this.type,
      this.time});

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      id: json['id'],
      itemName: json['item_name'],
      fullPrice: json['full_price'],
      halfPrice: json['half_price'],
      itemImage: json['item_image'],
      itemDesp: json['item_desp'],
      categoryId: json['category_id'],
      resturantId: json['resturant_id'],
      isHalf: json['isHalf'],
      type: json['type'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item_name'] = itemName;
    data['full_price'] = fullPrice;
    data['half_price'] = halfPrice;
    data['item_image'] = itemImage;
    data['item_desp'] = itemDesp;
    data['category_id'] = categoryId;
    data['resturant_id'] = resturantId;
    data['isHalf'] = isHalf;
    data['type'] = type;
    data['time'] = time;
    return data;
  }
}
