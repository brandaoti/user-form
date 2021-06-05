import 'package:user_form/shared/model/user.dart';
import 'package:user_form/shared/repository/internal_storage_adapter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlAdapter extends InternalStorageAdapter {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    print('Aqui é meu path: ${_database?.path}');
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    final data = await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE User(name TEXT, lastname TEXT)');
      },
      version: 1,
    );

    return data;
  }

  @override
  Future<String> currentUser() async {
    final Database db = await database;

    var data = await db.query(
      'User',
      columns: ['rowid', 'name', 'lastname'],
      // where: 'rowid = ?',
      // whereArgs: [2],
    );

    if (data.isNotEmpty) {
      final user = User.fromMap(data.last);
      return '${user.rowId} ' + user.name! + ' ' + user.lastname!;
    } else {
      return 'Usuário não encontrado!';
    }
  }

  @override
  void saveUser(String name, String lastname) async {
    final Database db = await database;

    final _user = User(name: name, lastname: lastname);

    Map<String, dynamic> user = _user.toMap();

    await db.insert('User', user);
  }

  @override
  void deleteUser() async {
    final Database db = await database;

    var deleteSQL = 'DELETE FROM User WHERE rowid = (SELECT MAX(rowid) FROM User)';

    await db.rawDelete(deleteSQL);
  }
}
