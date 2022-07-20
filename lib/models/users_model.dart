import 'package:flutter/cupertino.dart';

class UsersModel with ChangeNotifier{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UsersModel(
      {this.id, this.email, this.password, this.name, this.role, this.avatar});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  static List<UsersModel> usersFromSnapshot(List usersSnaphot) {
    // print("data ${usersSnaphot[0]}");
    return usersSnaphot.map((data) {
      return UsersModel.fromJson(data);
    }).toList();
  }
}
