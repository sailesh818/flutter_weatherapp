//import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  static const String tableName = 'articles';
  static const String id = "id";
  static const String title = "title";
  static const String author = "author";
  static const String description = "description";
  static const String url = "url";
  // static const String urlToImage = "urltoimage";
  // // static const DateTime publishedAt;
  // static const String content = "content";

  Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = "${databasePath.path}/articles.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
CREATE TABLE $tableName(
            $id INTEGER PRIMARY KEY AUTOINCREMENT,
            $title TEXT,
            $author TEXT,
            $description TEXT,
            $url TEXT
          )
''');
      },
    );
  }

  Future<void> insertArticle(Map<String, dynamic> article) async {
    final db = await database;
    await db.insert(
      tableName,
      article,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> fetchStoredArticles() async {
    final db = await DatabaseService().database;
    return await db.query(DatabaseService.tableName);
  }
}
