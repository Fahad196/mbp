class DashboardMenuModel {
 final int? id;
 final String? categoryName;
 final String? imgPath;
 final String? resturantId;

  DashboardMenuModel(
      {this.id, this.categoryName, this.imgPath, this.resturantId});

 factory DashboardMenuModel.fromJson(Map<String, dynamic> json) {
   return DashboardMenuModel(
 id : json['id'],
    categoryName : json['category_name'],
    imgPath : json['img_path'],
    resturantId : json['resturant_id']
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['img_path'] = imgPath;
    data['resturant_id'] = resturantId;
    return data;
  }
}