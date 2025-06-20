import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/sighting.dart';

class SightingDatabase {
  static final SightingDatabase instance = SightingDatabase._init();

  static Database? _database;

  SightingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('sightings.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE sightings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        species TEXT,
        timestamp TEXT,
        locationName TEXT,
        latitude REAL,
        longitude REAL,
        depth REAL,
        waterTemp REAL,
        visibility TEXT,
        behavior TEXT,
        notes TEXT
      )
    ''');
  }

  Future<int> insertSighting(Sighting sighting) async {
    final db = await instance.database;
    return await db.insert('sightings', sighting.toJson());
  }

  Future<List<Sighting>> getAllSightings() async {
    final db = await instance.database;
    final result = await db.query('sightings', orderBy: 'timestamp DESC');

    return result.map((json) => Sighting.fromJson(json)).toList();
  }

  Future close() async {
    final db = await database;
    db.close();
  }

}
