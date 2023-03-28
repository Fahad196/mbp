// ignore_for_file: unnecessary_this

class DeleteCartModel {
  int? itemId;
  int? resturantId;
  String? portion;

  DeleteCartModel({this.itemId, this.resturantId, this.portion});

  factory DeleteCartModel.fromJson(Map<String, dynamic> json) {
    return DeleteCartModel(
      itemId: json['item_id'],
      resturantId: json['resturant_id'],
      portion: json['portion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['resturant_id'] = this.resturantId;
    data['portion'] = this.portion;
    return data;
  }
}
