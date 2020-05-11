import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:math_everyday/helper/icon_data_helper.dart';

final String tableUser = 'user';
final String columnId = '_id';
final String columnName = 'name';
final String columnColor = 'color';
final String columnIcon = 'icon';
final String columnFile = 'file';

class User {
  int id;
  String name;
  Color color;
  IconData icon;
  File file;

  User({
    this.id,
    this.name,
    this.color,
    this.icon,
    this.file,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnColor: color.value,
      columnIcon: icon.toDbValue(),
      columnFile: file?.path,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[columnId],
      name: map[columnName],
      color: Color(map[columnName]),
      icon: (map[columnIcon] as String).toIconData(),
      file: map[columnFile] == null ? null : File(map[columnFile]),
    );
  }
}

class UserProvider {
  Database db;

  Future<void> open() async {
    db = await openDatabase(
      'everyday_math_user.db', 
      version: 1, 
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table $tableUser ( 
            $columnId integer primary key autoincrement, 
            $columnName text not null,
            $columnColor int not null,
            $columnIcon text,
            $columnFile text)
          ''');
      },
    );
  }

  Future<User> insert(User user) async {
    user.id = await db.insert(tableUser, user.toMap());
    return user;
  }

  Future<User> getUser(int id) async {
    List<Map> maps = await db.query(tableUser,
        columns: [columnId, columnName, columnColor, columnIcon, columnFile],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(User user) async {
    return await db.update(tableUser, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future close() async => db.close();
}
