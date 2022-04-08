import '../../entity/export.dart';

abstract class UserRepository {
  Future<List<User>> getUsers(ctx);
  Future<User> getUser(ctx, id);
  Future<User> insertUser(ctx, name, bureauId, gradeId);
  Future<User> updateUser(ctx, user);
  Future<User> deleteUser(ctx, user);
}
