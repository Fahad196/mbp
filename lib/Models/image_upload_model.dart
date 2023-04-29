class ImageUploadModel {
 final String? message;

  ImageUploadModel({this.message});

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) {
    return ImageUploadModel(
      message : json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}