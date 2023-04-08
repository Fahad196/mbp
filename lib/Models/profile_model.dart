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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['username'] = this.username;
    data['address'] = this.address;
    data['employeeid'] = this.employeeid;
    data['profile'] = this.profile;
    data['phone'] = this.phone;
    return data;
  }
}
