import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/controller/user_controller.dart';
import 'package:seeft_api/usecase/user_usecase.dart';
import 'package:seeft_api/entity/user.dart';
import 'package:seeft_api/config/http_status.dart';

void main() {
  final controller = UserController(StatusResponse(), UserUsecaseTest());

  test('user_controller.getUsers', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/users'));
    final users = await controller.getUsers(request);
    final correct = await _createList();
    expect(users.readAsString(), completion(jsonEncode(correct)));
  });

  test('user_controller.getUser', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/users/1'));
    final user = await controller.getUser(request, "1");
    final correct = await _createUser(User(id: 1));
    expect(user.readAsString(), completion(jsonEncode(correct)));
  });

  test('user_controller.insertUser', () async {
    var request = Request('POST', Uri.parse('http://localhost:3000/users/1'));
    final user = await controller.getUser(request, "1");
    final correct = await _createUser(User(id: 1));
    expect(user.readAsString(), completion(jsonEncode(correct)));
  });

  test('user_controller.updateUser', () async {
    var request = Request('PUT', Uri.parse('http://localhost:3000/users/1'));
    final user = await controller.getUser(request, "1");
    final correct = await _createUser(User(id: 1));
    expect(user.readAsString(), completion(jsonEncode(correct)));
  });
  test('user_controller.deletetUser', () async {
    var request = Request('DEL', Uri.parse('http://localhost:3000/users/1'));
    final user = await controller.getUser(request, "1");
    final correct = await _createUser(User(id: 1));
    expect(user.readAsString(), completion(jsonEncode(correct)));
  });
}

class UserUsecaseTest implements UserUsecase {
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
    return await _createUser(req);
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
  ));
}
