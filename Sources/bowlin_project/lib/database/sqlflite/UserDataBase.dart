import 'package:bowl_in/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../fields/UserFields.dart';
import '../mappers/UserMapper.dart';

class UserDatabase {

  UserDatabase();

  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  static const String tableUser = 'users';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableUser ( 
  ${UserFields.id} $idType, 
  ${UserFields.name} $boolType,
  ${UserFields.image} $textType,
  ${UserFields.mail} $textType
      )
''');
  }

  Future<void> createUser(User user) async {
    final db = await instance.database;
    await db.insert(tableUser, UserMapper.toJson(user));
  }

  Future<User?> readUser(int id) async {
    final db = await instance.database;
    final result = await db.query(
      tableUser,
      where: '${UserFields.id} = ?',
        whereArgs: [id]);
    return result.isNotEmpty ? UserMapper.toModel(result.first) : null;

  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUser,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}