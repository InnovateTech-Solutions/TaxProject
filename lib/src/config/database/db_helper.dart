import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory? documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory!.path, 'custom_directory', 'tax.db');
    print("########################################### path: $path");

    // Ensure the directory exists
    await Directory(join(documentsDirectory.path, 'custom_directory'))
        .create(recursive: true);

    return await openDatabase(
      path,
      version: 3, // Increment the version number
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT,
            telephone TEXT,
            email TEXT,
            taxNumber TEXT,
            country TEXT,
            province TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE TaxForm (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            year TEXT,
            taxPeriod TEXT,
            period INTEGER,
            field14 TEXT,
            field15 TEXT,
            field16 BOOLEAN,
            field17 BOOLEAN,
            field18 TEXT,
            field19 TEXT,
            userId INTEGER,
            FOREIGN KEY (userId) REFERENCES Users (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE Category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            equation TEXT,
            taxPeriod TEXT,
            taxPercentage REAL,
            taxFormId INTEGER,
            categoryId INTEGER, -- New field
            FOREIGN KEY (taxFormId) REFERENCES TaxForm (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE Bill (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            billNo TEXT,
            billValue REAL,
            taxValue REAL,
            date TEXT,
            categoryId INTEGER,
            FOREIGN KEY (categoryId) REFERENCES Category (id)
          )
        ''');
        await db.execute('''
          CREATE TABLE Other (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            value REAL,
            taxFormId INTEGER,
            FOREIGN KEY (taxFormId) REFERENCES TaxForm (id)
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          // Add the new period column to the existing TaxForm table
          await db.execute('ALTER TABLE TaxForm ADD COLUMN period INTEGER');
        }
        if (oldVersion < 2) {
          // Add the categoryId column to the existing Category table
          await db
              .execute('ALTER TABLE Category ADD COLUMN categoryId INTEGER');
        }
      },
    );
  }
}
