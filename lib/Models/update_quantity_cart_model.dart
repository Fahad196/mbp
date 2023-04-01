class UpdateQuantityCartModel {
  String? message;

  UpdateQuantityCartModel({this.message});

factory  UpdateQuantityCartModel.fromJson(Map<String, dynamic> json) {
   return UpdateQuantityCartModel(
 message : json['message']
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}