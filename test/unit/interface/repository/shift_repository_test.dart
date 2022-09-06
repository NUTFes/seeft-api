import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/repository/shift_repository.dart';
import 'package:seeft_api/interface/repository/external/database.dart';
import 'package:seeft_api/entity/entity.dart';

String testSQL = '';

void main() {
  final repository = ShiftRepositoryImpl(DatabaseTest());
  var context = Request('GET', Uri.parse('http://localhost:3000/shifts')).context;

  /*
  Todo: 汚いけどやり方わからないのでグローバル変数に代入してSQLをあってるか調べてる
  */

  group('shift_repository.getShifts', () {
    final correct = '''
SELECT
  shifts.id,
  shifts.user_id,
  users.name as user_name,
  users.bureau_id as user_bureau_id,
  users.grade_id as user_grade_id,
  users.created_at as user_created_at,
  users.updated_at as user_updated_at,
  users.deleted_at as user_deleted_at,
  shifts.task_id,
  tasks.task as task_name,
  tasks.color as task_color,
  tasks.place as task_place,
  tasks.url as task_url,
  tasks.superviser as task_superviser,
  tasks.notes as task_notes,
  tasks.created_at as task_created_at,
  tasks.updated_at as task_updated_at,
  tasks.deleted_at as task_deleted_at,
  shifts.year_id,
  years.year as year_name,
  years.created_at as year_created_at,
  years.updated_at as year_updated_at,
  years.deleted_at as year_deleted_at,
  shifts.date_id,
  dates.date as date_name,
  dates.created_at as date_created_at,
  dates.updated_at as date_updated_at,
  dates.deleted_at as date_deleted_at,
  shifts.time_id,
  times.time as time_name,
  times.created_at as time_created_at,
  times.updated_at as time_updated_at,
  times.deleted_at as time_deleted_at,
  shifts.weather_id,
  weathers.weather as weather_name,
  weathers.created_at as weather_created_at,
  weathers.updated_at as weather_updated_at,
  weathers.deleted_at as weather_deleted_at,
  shifts.is_attendance,
  shifts.created_user_id,
  shifts.updated_user_id,
  shifts.created_at as shift_created_at,
  shifts.updated_at as shift_updated_at,
  shifts.deleted_at as shift_deleted_at
FROM shifts
LEFT JOIN users ON shifts.user_id = users.id
LEFT JOIN tasks ON shifts.task_id = tasks.id
LEFT JOIN years ON shifts.year_id = years.id
LEFT JOIN dates ON shifts.date_id = dates.id
LEFT JOIN times ON shifts.time_id = times.id
LEFT JOIN weathers ON shifts.weather_id = weathers.id
WHERE user_id=1;
''';

    test('response is correct', () async {
      final res = await repository.getShiftsByUser(context, User(id: 1));
      expect(res, isList);
    });

    test('sql', () {
      expect(testSQL, correct);
    });
  });

  group('shift_repository.getShiftsByUserAndDateAndWeather', () {
    final correct = '''
SELECT
  shifts.id,
  shifts.user_id,
  users.name as user_name,
  users.bureau_id as user_bureau_id,
  users.grade_id as user_grade_id,
  users.created_at as user_created_at,
  users.updated_at as user_updated_at,
  users.deleted_at as user_deleted_at,
  shifts.task_id,
  tasks.task as task_name,
  tasks.color as task_color,
  tasks.place as task_place,
  tasks.url as task_url,
  tasks.superviser as task_superviser,
  tasks.notes as task_notes,
  tasks.created_at as task_created_at,
  tasks.updated_at as task_updated_at,
  tasks.deleted_at as task_deleted_at,
  shifts.year_id,
  years.year as year_name,
  years.created_at as year_created_at,
  years.updated_at as year_updated_at,
  years.deleted_at as year_deleted_at,
  shifts.date_id,
  dates.date as date_name,
  dates.created_at as date_created_at,
  dates.updated_at as date_updated_at,
  dates.deleted_at as date_deleted_at,
  shifts.time_id,
  times.time as time_name,
  times.created_at as time_created_at,
  times.updated_at as time_updated_at,
  times.deleted_at as time_deleted_at,
  shifts.weather_id,
  weathers.weather as weather_name,
  weathers.created_at as weather_created_at,
  weathers.updated_at as weather_updated_at,
  weathers.deleted_at as weather_deleted_at,
  shifts.is_attendance,
  shifts.created_user_id,
  shifts.updated_user_id,
  shifts.created_at as shift_created_at,
  shifts.updated_at as shift_updated_at,
  shifts.deleted_at as shift_deleted_at
FROM shifts
LEFT JOIN users ON shifts.user_id = users.id
LEFT JOIN tasks ON shifts.task_id = tasks.id
LEFT JOIN years ON shifts.year_id = years.id
LEFT JOIN dates ON shifts.date_id = dates.id
LEFT JOIN times ON shifts.time_id = times.id
LEFT JOIN weathers ON shifts.weather_id = weathers.id
WHERE user_id=1 AND
  weather_id=3 AND
  date_id=2;
''';

    test('response is correct', () async {
      final res = await repository.getShiftsByUserAndDateAndWeather(
          context,
          Shift(
            user: User(id: 1),
            date: Date(id: 2),
            weather: Weather(id: 3),
          ));
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
    {
      'id': 1,
      'user_id': 1,
      'user_name': 'hoge',
      'user_bureau_id': 1,
      'user_grade_id': 1,
      'task_id': 1,
      'task_name': 'hoge',
      'task_color': 'fff0f0',
      'task_place': 'hoge',
      'task_url': 'https://example.com',
      'task_superviser': 'hoge',
      'task_notes': Null,
      'year_id': 1,
      'year_name': 0,
      'date_id': 2,
      'date_name': 'hoge',
      'time_id': 1,
      'time_name': '10:00',
      'weather_id': 3,
      'weather_name': 'cloud',
      'shifts.is_attendance': 'false',
      'created_user_id': 1,
      'updated_user_id': 1,
      'createdAt': 'hoge',
      'updatedAt': 'fuga',
      'deletedAt': Null,
    }
  ]);
}

_createMap() async {
  return await Future<Map<String, dynamic>>.value({'hoge': 'hoge'});
}
