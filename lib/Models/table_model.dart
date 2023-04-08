class TableModel {
  final String? tableNo;
 final String? resturantId;

  TableModel({this.tableNo, this.resturantId});

 factory TableModel.fromJson(Map<String, dynamic> json) {
  return TableModel(
      tableNo : json['table_no'],
    resturantId : json['resturant_id'],
  );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['table_no'] = this.tableNo;
    data['resturant_id'] = this.resturantId;
    return data;
  }
}