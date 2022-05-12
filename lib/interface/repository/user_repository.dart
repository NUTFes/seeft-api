import '../../usecase/repository/user_repository.dart';
import './external/database.dart';
import '../../entity/export.dart';

class UserRepositoryImpl implements UserRepository {
  Database database;

  UserRepositoryImpl(this.database);

  Future<List<User>> getUsers(ctx) async {
    String sql = '''
SELECT * FROM users;
''';

    List<Map<String, dynamic>> data = await database.select(ctx, sql);
    List<User> list = [];

    data.forEach((d) {
      User user = User(
        id: d['id'],
        name: d['name'],
        bureauId: d['bureau_id'],
        gradeId: d['grade_id'],
        createdAt: d['created_at'].toString(),
        updatedAt: d['updated_at'].toString(),
        deletedAt: d['deleted_at'].toString(),
      );

      if (!user.isDeleted) {
        list.add(user);
      }
    });

    return list;
  }

  Future<User> getUser(ctx, id) async {
    String sql = '''
SELECT * FROM users WHERE id=${id};
''';
    var data = await database.single(ctx, sql);

    User user = User(
      id: data['id'],
      name: data['name'],
      bureauId: data['bureau_id'],
      gradeId: data['grade_id'],
      createdAt: data['created_at'].toString(),
      updatedAt: data['updated_at'].toString(),
      deletedAt: data['deleted_at'].toString(),
    );
    return user;
  }

  Future<User> insertUser(ctx, User req) async {
    String sql = '''
INSERT INTO users (name, bureau_id, grade_id) VALUES ("${req.name}", "${req.bureauId}", "${req.gradeId}") returning *;
''';

    var data = await database.insert(ctx, sql);
    if (data["id"] == 0) {
      print("error at UserRepository.insertUser");
    }

    User user = User(
      id: data['id'],
      name: data['name'],
      bureauId: data['bureau_id'],
      gradeId: data['grade_id'],
      createdAt: data['created_at'].toString(),
      updatedAt: data['updated_at'].toString(),
      deletedAt: data['deleted_at'].toString(),
    );
    return user;
  }

  Future<User> updateUser(ctx, User user) async {
    String sql = '''
UPDATE users SET name="${user.name}" WHERE id=${user.id};
''';
    String returningSQL = '''
SELECT * FROM users WHERE id=${user.id};
''';

    var data = await database.update(ctx, sql, returningSQL);
    User resultUser = User(
      id: data['id'],
      name: data['name'],
      bureauId: data['bureau_id'],
      gradeId: data['grade_id'],
      createdAt: data['created_at'].toString(),
      updatedAt: data['updated_at'].toString(),
      deletedAt: data['deleted_at'].toString(),
    );
    return resultUser;
  }

  Future<User> deleteUser(ctx, User user) async {
    String sql = '''
UPDATE users SET deleted_at=NOW() WHERE id=${user.id};
''';
    String returningSQL = '''
SELECT * FROM users WHERE id=${user.id};
''';

    var data = await database.update(ctx, sql, returningSQL);
    User resultUser = User(
      id: data['id'],
      name: data['name'],
      bureauId: data['bureau_id'],
      gradeId: data['grade_id'],
      createdAt: data['created_at'].toString(),
      updatedAt: data['updated_at'].toString(),
      deletedAt: data['deleted_at'].toString(),
    );
    return resultUser;
  }
}
