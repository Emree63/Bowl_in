import 'package:bowl_in/database/fields/PlayerFields.dart';
import 'package:bowl_in/database/mappers/GameMapper.dart';
import 'package:bowl_in/database/mappers/PlayerMapper.dart';
import 'package:bowl_in/database/mappers/StatMapper.dart';
import 'package:bowl_in/model/Game.dart';
import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/Player.dart';
import '../../model/Stat.dart';
import '../fields/GameDetailFields.dart';
import '../fields/GameFields.dart';
import '../fields/StatFields.dart';
import '../fields/UserFields.dart';
import '../mappers/GameDetailMapper.dart';
import '../mappers/UserMapper.dart';

class BowlInDatabase {
  BowlInDatabase();

  static final BowlInDatabase instance = BowlInDatabase._init();

  static Database? _database;

  BowlInDatabase._init();

  static const String tableUser = 'users';
  static const String tableGame = 'games';
  static const String tableGameDetail = 'gameDetails';
  static const String tableStat = 'stats';
  static const String tablePlayer = 'players';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 6, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const realType = 'REAL NOT NULL';

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

    await db.execute('''
CREATE TABLE $tableGameDetail (
  ${GameDetailFields.id} $idType,
  ${GameDetailFields.date} $textType,
  ${GameDetailFields.nameWinner} $textType,
  ${GameDetailFields.host} $integerType
)
''');

    await db.execute('''
CREATE TABLE $tableStat (
  ${StatFields.idUser} $integerType,
  ${StatFields.nbVictory} $integerType,
  ${StatFields.nbGames} $integerType,
  ${StatFields.highscore} $integerType,
  ${StatFields.nbStrikes} $integerType,
  ${StatFields.nbSpares} $integerType,
  ${StatFields.nbScore} $integerType,
  ${StatFields.avgScore} $realType,
  ${StatFields.avgPinsPerRound} $realType,
  FOREIGN KEY(${StatFields.idUser}) REFERENCES $tableUser(${UserFields.id})
)
''');

    await db.execute('''
CREATE TABLE $tablePlayer (
  id $idType,
  ${PlayerFields.name} $textType,
  ${PlayerFields.image} $textType,
  ${PlayerFields.idGame} $integerType,
  FOREIGN KEY(${PlayerFields.idGame}) REFERENCES $tableGame(${GameFields.id})
)
''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 6 ) {
      await db.execute('DROP TABLE IF EXISTS $tableUser');
      await db.execute('DROP TABLE IF EXISTS $tableGame');
      await db.execute('DROP TABLE IF EXISTS $tableGameDetail');
      await db.execute('DROP TABLE IF EXISTS $tableStat');
      await db.execute('DROP TABLE IF EXISTS $tablePlayer');
      await _createDB(db, newVersion);
    }
  }

  // User

  Future<void> createUser(User user) async {
    final db = await instance.database;
    await db.insert(tableUser, UserMapper.toJson(user));
    await createStat(user);
  }

  Future<User?> readUser(int id) async {
    final db = await instance.database;
    final result = await db
        .query(tableUser, where: '${UserFields.id} = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      final stat = await readStat(id);

      User user;
      if (stat != null) {
        user = UserMapper.toModel(result.first, stat);
      } else {
        user = UserMapper.toModel(result.first, Stat.empty());
      }
      final games = await readGame(id);
      for (var game in games) {
        user.games.add(game);
      }
      return user;
    } else {
      return null;
    }
  }

  Future<void> updateUser(User user) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      await txn.update(tableUser, UserMapper.toJson(user),
          where: '${UserFields.id} = ?', whereArgs: [user.id]);

      await txn.update(tableStat, StatMapper.toJson(user.stat, user),
          where: '${StatFields.idUser} = ?', whereArgs: [user.id]);

      // Insert new games for the user
      for (var game in user.games) {
        var result = await txn.query(tableGame,
            where: '${GameFields.id} = ? AND ${GameFields.userId} = ?',
            whereArgs: [game.id, user.id]);
        if (result.isNotEmpty) {
          await txn.update(tableGame, GameMapper.toJson(game, user),
              where: '${GameFields.id} = ? AND ${GameFields.userId} = ?',
              whereArgs: [game.id, user.id]);
        } else {
          await txn.insert(tableGame, GameMapper.toJson(game, user));
          for (var player in game.players) {
            await txn.insert(tablePlayer, PlayerMapper.toJson(player, game));
          }
        }
      }
    });
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    await deleteGame(id);

    await deleteStat(id);

    return await db.delete(
      tableUser,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  // GameDetail

  Future<void> createGameDetail(GameDetail gameDetail) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      await txn.insert(tableGameDetail, GameDetailMapper.toJson(gameDetail));
    });
  }

  Future<List<GameDetail>> readGameDetail() async {
    final db = await instance.database;
    final result = await db.query(tableGameDetail);

    if (result.isNotEmpty) {
      List<GameDetail> gameDetails = [];
      for (var gameDetail in result) {
        List<Player> players = [];
        Player? winner = null;
        final resultPlayer = await db.query(tablePlayer,
            where: '${PlayerFields.idGame} = ?',
            whereArgs: [gameDetail[GameDetailFields.id]]);
        for (var player in resultPlayer) {
          var rPlayer = PlayerMapper.toModel(player);
          players.add(rPlayer);
          if (rPlayer.name == gameDetail[GameDetailFields.nameWinner]) {
            winner = rPlayer;
          }
        }
        gameDetails.add(GameDetailMapper.toModel(gameDetail, winner, players));
      }
      return gameDetails;
    } else {
      return [];
    }
  }

  Future<int> deleteGameDetail() async {
    final db = await instance.database;

    return await db.delete(tableGameDetail);
  }

  // Game

  Future<void> createGame(User user) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      for (var game in user.games) {
        await txn.insert(tableGame, GameMapper.toJson(game, user));
      }
    });
  }

  Future<List<Game>> readGame(int id) async {
    final db = await instance.database;
    final result = await db
        .query(tableGame, where: '${GameFields.userId} = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      List<Game> games = [];
      for (var game in result) {
        List<Player> players = [];
        final resultPlayer = await db.query(tablePlayer,
            where: '${PlayerFields.idGame} = ?', whereArgs: [game[GameFields.id]]);
        for (var player in resultPlayer) {
          players.add(PlayerMapper.toModel(player));
        }
        games.add(GameMapper.toModel(game, players));
        players = [];
      }
      return games;
    } else {
      return [];
    }
  }

  Future<int> deleteGame(int id) async {
    final db = await instance.database;

    return await db.transaction((txn) async {
      await txn.delete(
        tablePlayer,
        where: '${PlayerFields.idGame} IN (SELECT ${GameFields.id} FROM $tableGame WHERE ${GameFields.userId} = ?)',
        whereArgs: [id],
      );

      return await txn.delete(
        tableGame,
        where: '${GameFields.userId} = ?',
        whereArgs: [id],
      );
    });
  }

  // Stat

  Future<void> createStat(User user) async {
    final db = await instance.database;
    await db.insert(tableStat, StatMapper.toJson(Stat.empty(), user));
  }

  Future<Stat?> readStat(int id) async {
    final db = await instance.database;
    final result = await db
        .query(tableStat, where: '${StatFields.idUser} = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      Stat stat = StatMapper.toModel(result.first);
      return stat;
    } else {
      return null;
    }
  }

  Future<void> updateStat(User user) async {
    final db = await instance.database;
    await db.transaction((txn) async {
      await txn.update(tableStat, StatMapper.toJson(user.stat, user),
          where: '${StatFields.idUser} = ?', whereArgs: [user.id]);
    });
  }

  Future<int> deleteStat(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableStat,
      where: '${StatFields.idUser} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
