// ignore_for_file: prefer_typing_uninitialized_variables

class ProfileModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? designation;
  final String? email;
  final String? username;
  final String? address;
  final String? employeeid;
  final profile;
  final String? phone;

  ProfileModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.designation,
      this.email,
      this.username,
      this.address,
      this.employeeid,
      this.profile,
      this.phone});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      designation: json['designation'],
      email: json['email'],
      username: json['username'],
      address: json['address'],
      employeeid: json['employeeid'],
      profile: json['profile'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['designation'] = designation;
    data['email'] = email;
    data['username'] = username;
    data['address'] = address;
    data['employeeid'] = employeeid;
    data['profile'] = profile;
    data['phone'] = phone;
    return data;
  }
}
