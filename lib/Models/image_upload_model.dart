class ImageUploadModel {
 final String? message;

  ImageUploadModel({this.message});

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) {
    return ImageUploadModel(
      message : json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}