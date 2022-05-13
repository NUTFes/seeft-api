import '../../../entity/user.dart';

abstract class Database {
  Future<List<Map<String, dynamic>>> finds(ctx, sql);
  Future<Map<String, dynamic>> find(ctx, sql);
  Future<Map<String, dynamic>> insert(ctx, sql);
  Future<Map<String, dynamic>> update(ctx, sql, getSQL);
}
