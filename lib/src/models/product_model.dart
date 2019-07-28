import 'package:scoped_model/scoped_model.dart';

class ProductModel {
  String name;
  String categoryId;
  String id;

  ProductModel({this.id, this.name, this.categoryId});

  ProductModel.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.categoryId = json["categoryId"],
        this.id = json["id"];

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'categoryId': categoryId};
  }
}
