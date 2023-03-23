import 'package:bowl_in/database/mappers/GameMapper.dart';
import 'package:bowl_in/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../fields/GameFields.dart';
import '../fields/UserFields.dart';
import '../mappers/UserMapper.dart';

class UserDatabase {
  UserDatabase();

  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  static const String tableUser = 'users';
  static const String tableGame = 'games';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 4, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableUser ( 
  ${UserFields.id} $idType, 
  ${UserFields.name} $boolType,
  ${UserFields.image} $textType,
  ${UserFields.mail} $textType
      )
''');

    await db.execute('''
CREATE TABLE $tableGame (
  ${GameFields.id} $idType,
  ${GameFields.date} $textType,
  ${GameFields.pointsCurrentUser} $integerType,
  ${GameFields.userId} $integerType,
  FOREIGN KEY(${GameFields.userId}) REFERENCES $tableUser(${UserFields.id})
)
''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 4) {
      await db.execute('DROP TABLE IF EXISTS $tableUser');
      await db.execute('DROP TABLE IF EXISTS $tableGame');
      await _createDB(db, newVersion);
    }
  }

  Future<void> createUser(User user) async {
    final db = await instance.database;
    await db.insert(tableUser, UserMapper.toJson(user));
  }

  Future<User?> readUser(int id) async {
    final db = await instance.database;
    final result = await db
        .query(tableUser, where: '${UserFields.id} = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      User user = UserMapper.toModel(result.first);
      final games = await db
          .query(tableGame, where: '${GameFields.userId} = ?', whereArgs: [user.id]);
      for (var game in games) {
        user.games.add(GameMapper.toModel(game));
      }
      return user;
    }
    else {
      return null;
    }
  }

  Future<void> updateUser(User user) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      await txn.update(tableUser, UserMapper.toJson(user),
          where: '${UserFields.id} = ?', whereArgs: [user.id]);

      // Insert new games for the user
      for (var game in user.games) {
        await txn.insert(tableGame, GameMapper.toJson(game, user));
      }
    });
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
