// ignore_for_file: unnecessary_this
class TableModel {
  final int? id;
  final String? tableNo;
  final String? resturantId;

  TableModel({this.id, this.tableNo, this.resturantId});

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'],
      tableNo: json['table_no'],
      resturantId: json['resturant_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['table_no'] = this.tableNo;
    data['resturant_id'] = this.resturantId;
    return data;
  }
}
