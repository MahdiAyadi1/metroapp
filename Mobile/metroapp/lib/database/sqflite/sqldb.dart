// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{

  static Database? _db;

  Future<Database?> get db async{
    if (_db == null){
      _db = await initialDb();
      return _db;
    }else{
      return _db;
    }
  }


  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db') ;
    Database mydb = await openDatabase(path, onCreate: _onCreate,version: 1,onUpgrade: _onUpgrade) ;
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion)async{
    print("onUpgrade =====================");
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    
  }

  _onCreate(Database db, int version) async{
    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE "ligne" (
     "num_ligne" INTEGER NOT NULL PRIMARY KEY,
     "nb_stations" TEXT NOT NULL
    )
    ''');
    batch.execute('''
    CREATE TABLE "station" (
     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
     "nom" TEXT NOT NULL,
     "coordonne" TEXT NOT NULL,
     "num_ligne" INTEGER NOT NULL,
     "num_station" INTEGER NOT NULL,
     FOREIGN KEY (num_ligne) REFERENCES ligne(num_ligne)
    )
    ''');
    await batch.commit();
    print("onCreate =====================");
  }

  readData(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeleteDataBase () async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db') ;
    await deleteDatabase(path);
  }

}
