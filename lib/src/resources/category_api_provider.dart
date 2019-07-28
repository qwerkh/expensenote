import 'dart:convert';
import 'dart:async';
import 'category_repository.dart';
import '../models/category_model.dart';
import '_api_helper.dart';
import 'package:http/http.dart' show Client;

class CategoryApiProvider implements Source {
  static const _root = ApiHelper.getRoot;
  Client client = Client();
  String _categoryUrl = "$_root/methods/api_fetchCategory";

  @override
  Future<CategoryModel> fetchCategoryById(int id) async {
    // TODO: implement fetchCategory
    final response = await client.get("$_root/");
    final parsedJson = json.decode(response.body);
    return CategoryModel.fromJson(parsedJson);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchCategory() {
    // TODO: implement fetchCategory
    client.post(_categoryUrl, headers: {
      "Content-Type": "application/json; charset=UTF-8"
    }).then((onValue) {
      print(onValue.body);
    });

    return null;
  }
}
