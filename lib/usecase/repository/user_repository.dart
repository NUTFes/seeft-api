import '../../entity/export.dart';

abstract class UserRepository {
  Future<List<User>> getUsers(ctx);
  Future<User> getUser(ctx, id);
  Future<User> insertUser(ctx, User req);
  Future<User> updateUser(ctx, User user);
  Future<User> deleteUser(ctx, User user);
}
