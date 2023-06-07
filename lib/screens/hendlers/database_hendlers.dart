import 'dart:io';

import 'package:formapp/screens/model/users.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Database? db;

  Future<Database> createDb() async {
    if (db != null) {
      return db!;
    } else {
      //database create
      Directory dir = await getApplicationDocumentsDirectory();
      String dbpath = join(dir.path, "users_db");
      var db = await openDatabase(dbpath, version: 1, onCreate: createTables);
      return db!;
    }
  }

  createTables(Database db, int version) {
    //create Table
    db.execute(
        "create table users (pid integer primary key autoincrement,fullName text,lastName text,gender text,country text,hobbyData text)");
    print("Table Created");
  }

  Future<int> insertUsers(
      fullName, lastName, gender, country, hobbyData) async {
    //create db
    var sdb = await createDb();
    var id = await sdb.rawInsert(
        "insert into users (fullName,lastName,gender,country,hobbyData) values (?,?,?,?,?)",
        [fullName, lastName, gender, country, hobbyData]);
    return id;
  }

  Future<List> viewUsers() async {
    var sdb = await createDb();
    var eid = await sdb.rawQuery("select * from users");
    return eid.toList();
  }

  Future<List<Map<String, dynamic>>> getSingleUsers(id) async {
    var sdb = await createDb();
    var data = await sdb.rawQuery("select * from users where pid=?", [id]);
    return data;
  }

  Future<int> updateUsers(
      fullName, lastName, gender, country, hobbyData, id) async {
    var sdb = await createDb();
    var status = await sdb.rawUpdate(
        "update users set fullName=?,lastName=?,gender=?,country=?,hobbyData=? where pid=?",
        [fullName, lastName, gender, country, hobbyData, id]);
    print("status:$fullName");
    return status;
  }
}
