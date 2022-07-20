import 'package:flutter/material.dart';

class CategoriesModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  CategoriesModel({this.id, this.name, this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  static List<CategoriesModel> categoriesFromSnapshot(List categoriesSnaphot) {
    // print("data ${categoriesSnaphot[0]}");
    return categoriesSnaphot.map((data) {
      return CategoriesModel.fromJson(data);
    }).toList();
  }
}
