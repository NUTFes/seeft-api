import 'dart:async';
import 'package:mysql1/mysql1.dart';

import '../../interface/repository/external/database.dart';

class Mysql implements Database {
  late MySqlConnection conn;

  Mysql();

  Future<void> connect() async {
    final ConnectionSettings settings =
        new ConnectionSettings(host: 'localhost', port: 3306, user: 'mysql', password: 'pwd', db: 'seeft');
    conn = await MySqlConnection.connect(settings);
  }

  Future<List<Map<String, dynamic>>> get(ctx, sql) async {
    try {
      var results = await this.conn.query(sql);
      List resultsList = results.toList();
      List<Map<String, dynamic>> list = [];

      if (resultsList.length == 0) {
        throw Exception("Bad state: No element");
      }

      resultsList.forEach((result) {
        list.add(result.fields);
      });

      return list;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> single(ctx, sql) async {
    try {
      var result = await this.conn.query(sql);
      var data = result.first.fields;
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> insert(ctx, sql) async {
    try {
      var result = await conn.query(sql);
      var data = result.first.fields;
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> update(ctx, sql, getSQL) async {
    try {
      await conn.query(sql);
      var result = await conn.query(getSQL);
      var data = result.first.fields;
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
