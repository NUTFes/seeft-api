import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/repository/user_repository.dart';
import 'package:seeft_api/interface/repository/external/database.dart';
import 'package:seeft_api/entity/user.dart';

String testSQL = '';
String returningSQL = '';

void main() {
  final repository = UserRepositoryImpl(DatabaseTest());
  var context = Request('GET', Uri.parse('http://localhost:3000/users')).context;

  /*
  Todo: 汚いけどやり方わからないのでグローバル変数に代入してSQLをあってるか調べてる
  */

  group('user_repository.getUsers', () {
    final correct = '''
SELECT * FROM users;
''';

    test('response is correct', () async {
      final res = await repository.getUsers(context);
      expect(res, isList);
    });

    test('sql', () {
      expect(testSQL, correct);
    });
  });

  group('user_repository.getUser', () {
    final correct = '''
SELECT * FROM users WHERE id=1;
''';

    test('response is correct', () async {
      final res = await repository.getUser(context, 1);
      final hoge = await _createMap();
      final user = _convertUser(hoge);
      expect(res.toJson(), user.toJson());
    });

    test('sql', () {
      expect(testSQL, correct);
    });
  });

  final req = User(id: 1, name: 'hoge', bureauId: 1, gradeId: 2);
  group('user_repository.insertUser', () {
    final correct = '''
INSERT INTO users (name, bureau_id, grade_id)
    VALUES ("${req.name}", "${req.bureauId}", "${req.gradeId}") 
    returning *;
''';

    test('sql', () async {
      await repository.insertUser(context, req);
      expect(testSQL, correct);
    });
  });

  group('user_repository.updateUser', () {
    final correct = '''
UPDATE users SET name="${req.name}" WHERE id=${req.id};
''';
    final returningCorrect = '''
SELECT * FROM users WHERE id=${req.id};
''';

    test('sql', () async {
      await repository.updateUser(context, req);
      expect(testSQL, correct);
      expect(returningSQL, returningCorrect);
    });
  });

  group('user_repository.deleteUser', () {
    final correct = '''
UPDATE users SET deleted_at=NOW() WHERE id=${req.id};
''';
    final returningCorrect = '''
SELECT * FROM users WHERE id=${req.id};
''';

    test('sql', () async {
      await repository.deleteUser(context, req);
      expect(testSQL, correct);
      expect(returningSQL, returningCorrect);
    });
  });
}

class DatabaseTest implements Database {
  @override
  Future<List<Map<String, dynamic>>> finds(ctx, String sql) async {
    testSQL = sql;
    return await _createList();
  }

  @override
  Future<Map<String, dynamic>> find(ctx, String sql) async {
    testSQL = sql;
    return await _createMap();
  }

  @override
  Future<Map<String, dynamic>> insert(ctx, String sql) async {
    testSQL = sql;
    return await _createMap();
  }

  @override
  Future<Map<String, dynamic>> update(ctx, String sql, String getSQL) async {
    testSQL = sql;
    returningSQL = getSQL;
    return await _createMap();
  }
}

User _convertUser(Map<String, dynamic> data) {
  return User(
    id: data['id'],
    name: data['name'],
    bureauId: data['bureau_id'],
    gradeId: data['grade_id'],
    createdAt: data['created_at'],
    updatedAt: data['updated_at'],
    deletedAt: data['deleted_at'],
  );
}

_createList() async {
  return await Future<List<Map<String, dynamic>>>.value([
    {
      'id': 1,
      'name': 'hoge',
      'bureau_id': 1,
      'grade_id': 2,
    }
  ]);
}

_createMap() async {
  return await Future<Map<String, dynamic>>.value({
    'id': 1,
    'name': 'hoge',
    'bureau_id': 1,
    'grade_id': 2,
  });
}
