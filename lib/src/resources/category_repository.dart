import 'dart:async';
import 'category_api_provider.dart';
import 'category_db_provider.dart';
import '../models/category_model.dart';

class CategoryRepository {
  List<Source> sources = <Source>[
    categoryDbProvider,
    CategoryApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    categoryDbProvider,
  ];
  Future<List<CategoryModel>> fetchCategory() async{
    CategoryListModel category;
    var source;
    for(source in sources){
      var respond=await source.fetchCategory();
      print(respond);
      if(respond!=null){
        category=CategoryListModel.fromJson(respond);
        print(category);
        break;
      }
    }
    for (var cache in caches){
      if(cache !=source){

        //cache.addCategory(category);
      }
    }
    return category.category;
  }

  clearCache() async{
    for(var cache in caches){
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<CategoryModel> fetchCategoryById(int id);
  Future<List<Map<String,dynamic>>> fetchCategory();
}

abstract class Cache {
  Future<int> addCategory(CategoryModel category);
  Future<int> clear();
}
