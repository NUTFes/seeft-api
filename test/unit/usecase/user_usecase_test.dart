import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/usecase/repository/user_repository.dart';
import 'package:seeft_api/usecase/user_usecase.dart';
import 'package:seeft_api/entity/user.dart';

void main() {
  final usecase = UserUsecaseImpl(UserRepositoryTest());
  final context = Request('GET', Uri.parse('http://localhost:3000/users')).context;

  test('user_usecase.getUsers', () async {
    final users = await usecase.getUsers(context);
    final correct = await _createList();
    expect(jsonEncode(users), jsonEncode(correct));
  });

  test('user_usecase.getUser', () async {
    final request = User(id: 1);
    final user = await usecase.getUser(context, request.id);
    final correct = await _createUser(request);
    expect(jsonEncode(user), jsonEncode(correct));
  });

  test('user_usecase.inserttUser', () async {
    final request = User(
      id: 1,
      name: 'hoge',
      bureauId: 1,
      gradeId: 1,
    );
    final user = await usecase.insertUser(context, request);
    final correct = await _createUser(request);
    expect(jsonEncode(user), jsonEncode(correct));
  });

  test('user_usecase.updatetUser', () async {
    final request = User(
      id: 1,
      name: 'hoge',
      bureauId: 1,
      gradeId: 1,
    );
    final user = await usecase.updateUser(context, request);
    final correctUser = User(
        id: request.id,
        name: request.name,
        bureauId: request.bureauId,
        gradeId: request.gradeId,
        updatedAt: DateTime(2000));
    expect(jsonEncode(user), jsonEncode(correctUser));
  });

  test('user_usecase.deletetUser', () async {
    final request = User(
      id: 1,
      name: 'hoge',
      bureauId: 1,
      gradeId: 1,
    );
    final user = await usecase.deleteUser(context, request);
    final correct = await _createUser(request);
    expect(jsonEncode(user), jsonEncode(correct));
  });
}

class UserRepositoryTest implements UserRepository {
  @override
  Future<List<User>> getUsers(ctx) async {
    final list = await _createList();
    return list;
  }

  @override
  Future<User> getUser(ctx, int id) async {
    return await _createUser(User(id: id));
  }

  @override
  Future<User> insertUser(ctx, User req) async {
    return await _createUser(req);
  }

  @override
  Future<User> updateUser(ctx, User req) async {
    final user =
        User(id: req.id, name: req.name, bureauId: req.bureauId, gradeId: req.gradeId, updatedAt: DateTime(2000));
    return await _createUser(user);
  }

  @override
  Future<User> deleteUser(ctx, User req) async {
    return await _createUser(req);
  }
}

_createList() async {
  return await Future<List<User>>.value([
    User(),
    User(id: 1, name: 'hoge'),
  ]);
}

_createUser(User req) async {
  return await Future<User>.value(User(
    id: req.id,
    name: req.name,
    bureauId: req.bureauId,
    gradeId: req.gradeId,
    createdAt: req.createdAt,
    updatedAt: req.updatedAt,
    deletedAt: req.deletedAt,
  ));
}
