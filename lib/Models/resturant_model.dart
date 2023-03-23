// ignore_for_file: unnecessary_this, prefer_collection_literals, prefer_typing_uninitialized_variables

class ResturantModel{
 final int? resId;
 final  String? resturantName;
 final String? resturantImagePath;
 final String? status;
 

  ResturantModel(
     { this.resId, this.resturantName, this.resturantImagePath, this.status,});

 factory ResturantModel.fromJson(Map<String, dynamic> json) {
   return ResturantModel(
    resId : json['id'],
    resturantName :json['resturant_name'],
    resturantImagePath :json['img_path'],
    status : json['status'],
   
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['res_id'] = this.resId;
    data['resturant_name'] = this.resturantName;
    data['resturant_image_path'] = this.resturantImagePath;
    data['status'] = this.status;
    return data;
  }
}




// class ResturantModel {
//   final int id;
//   final String name;
//   final String imageUrl;
//   final String status;

//   ResturantModel(
//       {required this.id,
//       required this.name,
//       required this.imageUrl,
//       required this.status});

//   factory ResturantModel.fromJson(Map<String, dynamic> json) {
//     return ResturantModel(
//       id: json['id'],
//       name: json['name'],
//       imageUrl: json['imageUrl'],
//       status: json['status'],
//     );
//   }


//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }
