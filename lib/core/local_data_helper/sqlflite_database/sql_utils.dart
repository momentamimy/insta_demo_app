import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteUtils {
  static Database? _database;
  static const String databaseName = 'your_database.db';

  // Singleton pattern to ensure only one instance of the database is created
  static Future<Database> get _getDatabase async {
    if (_database != null) return _database!;

    // If _database is null, instantiate it
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables and perform initial setup if needed
        await db.execute('''
          CREATE TABLE ${TableName.clients.name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            phone TEXT NOT NULL,
            address TEXT,
            notes TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE ${TableName.cases.name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            caseStatus INTEGER NOT NULL,
            caseName TEXT NOT NULL,
            caseNumber TEXT NOT NULL,
            caseYear TEXT NOT NULL,
            clientId INTEGER NOT NULL,
            clientDescription TEXT NOT NULL,
            opponentName TEXT NOT NULL,
            caseDate TEXT NOT NULL,
            nextHearingDate TEXT NOT NULL,
            closingDate TEXT,
            decision TEXT,
            notify INTEGER NOT NULL,
            notes TEXT
          )
        ''');
        // Add more tables as needed
      },
    );
  }

  static Future<List<Map<String, dynamic>>> fetchData(String tableName,
      {Database? testDatabase}) async {
    final db = testDatabase ?? await _getDatabase;
    return await db.query(
      tableName,
    );
  }

  static Future<Map<String, dynamic>?> fetchDataById(String tableName, int id,
      {Database? testDatabase}) async {
    final db = testDatabase ?? await _getDatabase;
    List<Map<String, dynamic>> result =
        await db.query(tableName, where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? result.first : null;
  }

  // Example: Insert data into the database
  static Future<bool> insertData(String tableName, Map<String, dynamic> data,
      {Database? testDatabase}) async {
    final db = testDatabase ?? await _getDatabase;
    final res = await db.insert(tableName, data);
    return res == 1;
  }

  static Future<bool> updateData(
      String tableName, int id, Map<String, dynamic> data,
      {Database? testDatabase}) async {
    final db = testDatabase ?? await _getDatabase;
    final res = await db
        .update(tableName, data, where: 'id = ?', whereArgs: [id]);
    return res == 1;
  }

  static Future<bool> deleteData(String tableName, int id,
      {Database? testDatabase}) async {
    final db = testDatabase ?? await _getDatabase;
    final res = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return res == 1;
  }

  static Future<void> deleteDB({Database? testDatabase}) async {
    if (testDatabase != null) {
      testDatabase.close();
      return;
    }
    final path = join(await getDatabasesPath(), databaseName);

    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }

    if (await File(path).exists()) {
      await deleteDatabase(path);
    }
  }

  static close() {
    if (_database != null) _database!.close();
  }
}

enum TableName {
  clients("CLIENTS"),
  cases("CASES");

  const TableName(this.name);

  final String name;
}
