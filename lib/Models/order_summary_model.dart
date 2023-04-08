class OrderSummaryModel {
  final int? id;
  final String? tableNo;
  final String? flag;
  final String? resturantName;
  final String? grandtotal;

  OrderSummaryModel(
      {this.id, this.tableNo, this.flag, this.resturantName, this.grandtotal});

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) {
   return OrderSummaryModel(
     id : json['id'],
    tableNo : json['table_no'],
    flag : json['flag'],
    resturantName : json['resturant_name'],
    grandtotal : json['grandtotal'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['table_no'] = this.tableNo;
    data['flag'] = this.flag;
    data['resturant_name'] = this.resturantName;
    data['grandtotal'] = this.grandtotal;
    return data;
  }
}