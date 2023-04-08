class OrderNowModel {
  final String? message;

  OrderNowModel({this.message});

  factory OrderNowModel.fromJson(Map<String, dynamic> json) {
   return OrderNowModel(
     message : json['message'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}