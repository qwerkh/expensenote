import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:core';

class DatabaseHelper {
  static final _databaseName = "mb.db";
  static final _version = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _version);
  }

  getPathDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return path;
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowsCount(String table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM  $table"));
  }

  Future<int> update(String table, Map<String,dynamic> row) async{
      Database db=await instance.database;
      int id=row["id"];
      return await db.update(table, row,where: "id=?",whereArgs: [id]);

  }

  Future<int> delete(String table,int id) async{
    Database db=await instance.database;
    return await db.delete(table,where:"id=?",whereArgs: [id]);

  }
}
