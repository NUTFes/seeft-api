import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/repository/time_repository.dart';
import 'package:seeft_api/interface/repository/external/database.dart';

String testSQL = '';

void main() {
  final repository = TimeRepositoryImpl(DatabaseTest());
  var context = Request('GET', Uri.parse('http://localhost:3000/times')).context;

  /*
  Todo: 汚いけどやり方わからないのでグローバル変数に代入してSQLをあってるか調べてる
  */

  group('time_repository.getTimes', () {
    final correct = '''
SELECT * FROM times;
''';

    test('response is correct', () async {
      final res = await repository.getTimes(context);
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
  return await Future<List<Map<String, dynamic>>>.value([
    {'id': 1, 'time': '10:00'}
  ]);
}

_createMap() async {
  return await Future<Map<String, dynamic>>.value({'hoge': 'hoge'});
}
