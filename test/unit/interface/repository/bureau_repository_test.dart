import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/repository/bureau_repository.dart';
import 'package:seeft_api/interface/repository/external/database.dart';

String testSQL = '';

void main() {
  final repository = BureauRepositoryImpl(DatabaseTest());
  var context = Request('GET', Uri.parse('http://localhost:3000/bureaus')).context;

  /*
  Todo: 汚いけどやり方わからないのでグローバル変数に代入してSQLをあってるか調べてる
  */

  group('bureau_repository.getBureaus', () {
    final correct = '''
SELECT * FROM bureaus;
''';

    test('response is correct', () async {
      final res = await repository.getBureaus(context);
      expect(res, isList);
    });

    test('sql', () {
      expect(testSQL, correct);
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
    return await _createMap();
  }

  @override
  Future<Map<String, dynamic>> insert(ctx, String sql) async {
    return await _createMap();
  }

  @override
  Future<Map<String, dynamic>> update(ctx, String sql, String getSQL) async {
    return await _createMap();
  }
}

_createList() async {
  final date = DateTime(10);
  return await Future<List<Map<String, dynamic>>>.value([
    {'id': 1, 'bureau': 'somu', 'color': 'ffffff', 'createdAt': 'hoge', 'updatedAt': 'fuga', 'deletedAt': Null,}
  ]);
}

_createMap() async {
  return await Future<Map<String, dynamic>>.value({'hoge': 'hoge'});
}
