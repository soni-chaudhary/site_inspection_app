import 'package:site_inspection_app/models/daily_report.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('inspection.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_reports (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        totalPassed TEXT NOT NULL
      )
    ''');
  }

Future<bool> insertReport(DailyReport report) async {
  final db = await instance.database;

  final today = DateTime.now();
  final todayStart = DateTime(today.year, today.month, today.day);

  // Check if report for today exists
  final existingReports = await db.query(
    'daily_reports',
    where: 'date >= ? AND date < ?',
    whereArgs: [
      todayStart.toIso8601String(),
      todayStart.add(Duration(days: 1)).toIso8601String(),
    ],
  );

  if (existingReports.isNotEmpty) {
    return false; // Report already exists
  }

  await db.insert('daily_reports', report.toMap());
  return true; // Successfully inserted
}

  Future<List<DailyReport>> getReports() async {
    final db = await instance.database;
    final result = await db.query('daily_reports');
    return result.map((map) => DailyReport.fromMap(map)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
