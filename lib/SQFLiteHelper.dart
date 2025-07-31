
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';//(ffi-Foreign Function Interface)

class SQFLiteHelper{
  Future<Database> openMyDatabase() async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      //  Initialize FFI for desktop platforms
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = Platform.isAndroid || Platform.isIOS
        ? await getDatabasesPath()
        : await databaseFactory.getDatabasesPath();

    final path = join(dbPath, 'myDatabase.db');

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) {
          db.execute('CREATE TABLE todoList(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
              ' title TEXT, '
              'status  INTEGER)');        },
      ),
    );
  }

  Future<void> insertTask(String title, bool status) async{
    final db = await openMyDatabase();

    db.insert('todoList', {
      'title':title,
      'status':status?1:0
      //1 for true 0 for false.
    },
    conflictAlgorithm: ConflictAlgorithm.replace
    );

  }
  Future<void> deleteTask(int id) async {
    final db= await openMyDatabase();
    db.delete('todoList', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id , bool status) async{
    final db = await openMyDatabase();
    db.update('todoList', {
      'status': status?1:0,

    },
    where: 'id=?',
      whereArgs: [id]
    );
  }

  Future<List<Map<String,dynamic>>> getTasks() async{
    final db = await openMyDatabase();
    return await db.query('todoList');
  }

}