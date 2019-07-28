import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'category_repository.dart';
import '../models/category_model.dart';
import '_db_helper.dart';

class CategoryDbProvider implements Source,Cache{
  Database db;
  final dbHelper = DatabaseHelper.instance;

  CategoryDbProvider() {
    init();
  }

  void init() async {
    final path=dbHelper.getPathDB();
    db = await openDatabase(path, version: 1,
        onCreate: (Database mbdb, int version) {
      mbdb.execute("""
          CREATE TABLE mb_category(
            id INTEGER PRIMARY KEY,
            name TEXT,
          )
        
        """);
    });
  }
  @override
  Future<CategoryModel> fetchCategoryById(int id) async {
    final maps = await db
        .query("mb_category", columns: null, where: "id=?", whereArgs: [id]);
    if (maps.length > 0) {
      return CategoryModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> removeCategory() {
    return db.delete("mb_category");
  }



  @override
  Future<int> addCategory(CategoryModel category) {
    // TODO: implement addCategory
    return db.insert("mb_category", category.toDb(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  @override
  Future<int> clear() {
    // TODO: implement clear
    return null;
  }

  @override
  Future<List<Map<String,dynamic>>> fetchCategory() async{
    // TODO: implement fetchCategory
    final maps = await db
        .query("mb_category", columns: null);
    print("===========Fetch Category============");
    print(maps);
    print("===========Close Fetch Category============");
    if (maps.length > 0) {
      return maps;
    }
    return null;
  }


}

final categoryDbProvider = CategoryDbProvider();
