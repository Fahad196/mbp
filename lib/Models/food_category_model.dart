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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['full_price'] = this.fullPrice;
    data['half_price'] = this.halfPrice;
    data['item_image'] = this.itemImage;
    data['item_desp'] = this.itemDesp;
    data['category_id'] = this.categoryId;
    data['resturant_id'] = this.resturantId;
    data['isHalf'] = this.isHalf;
    data['type'] = this.type;
    data['time'] = this.time;
    return data;
  }
}
