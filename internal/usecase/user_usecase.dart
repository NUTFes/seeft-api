import '../entity/export.dart';
import './repository/user_repository.dart';
import './repository/session_repository.dart';

class UserUsecase {
  UserRepository userRepository;
  SessionRepository sessionRepository;
  
  UserUsecase(this.userRepository, this.sessionRepository);

  Future<List<User>> getUsers(ctx) async {
    List<User> users = await userRepository.getUsers(ctx);
    print(users);
    return users;
  }
  
  Future<User> getUser(ctx, int id) async {
    User user = await userRepository.getUser(ctx, id);
    return user;
  }

  Future<User> insertUser(ctx, String name) async {
    User user = await userRepository.insertUser(ctx, name);
    return user;
  }

  Future<User> updateUser(ctx, User req) async {
    User test = await userRepository.getUser(ctx, req.id);
    if (req.name == test.name) {
      throw Exception('request name is same.');
    }
    User user = await userRepository.updateUser(ctx, req);

    if (test.updatedAt == user.updatedAt) {
      throw Exception('cant updated');
    }
    return user;
  }

  Future<User> deleteUser(ctx, User req) async {
    User user = await userRepository.deleteUser(ctx, req);
    return user;
  }

  Future<List<Session>> getSessionByUserID(ctx, Session req) async {
    List<Session> sessions = await sessionRepository.getSessionByUserID(
      ctx,
      req
    );
    return sessions;
  }

}
