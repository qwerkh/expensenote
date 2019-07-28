class CategoryListModel {
  List<CategoryModel> category;

  CategoryListModel(this.category);

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = new List<CategoryModel>();
      json['category'].forEach((data) {
        category.add(new CategoryModel.fromJson(data));
      });
    }
  }
}

class CategoryModel {
  String id;
  String name;
  String code;

  CategoryModel(this.id, this.name, this.code);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        code = json["code"];

  CategoryModel.fromDb(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        code = json["code"];

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "code": code};
  }

  Map<String, dynamic> toDb() {
    return {"id": id, "name": name, "code": code};
  }
}
