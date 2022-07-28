import 'package:test/test.dart';
import 'dart:convert';

import 'package:seeft_api/entity/entity.dart';

void main() {
  final Shift testShift = Shift(
    id: 1,
    user: User(id: 1),
    task: Task(id: 1),
    year: Year(id: 1),
    date: Date(id: 1),
    time: Time(id: 1),
    weather: Weather(id: 1),
    isAttendance: true,
    createdUserId: 1,
    updatedUserId: 1,
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create shift entity', () {
    final Shift shift = Shift();
    expect(shift.id, 0);
    expect(shift.user.id, 0);
    expect(shift.task.id, 0);
    expect(shift.year.id, 0);
    expect(shift.date.id, 0);
    expect(shift.time.id, 0);
    expect(shift.weather.id, 0);
    expect(shift.isAttendance, false);
    expect(shift.createdUserId, 0);
    expect(shift.updatedUserId, 0);
    expect(shift.createdAt, DateTime(0));
    expect(shift.updatedAt, DateTime(0));
    expect(shift.deletedAt, null);

    expect(testShift.id, 1);
    expect(testShift.user.id, 1);
    expect(testShift.task.id, 1);
    expect(testShift.year.id, 1);
    expect(testShift.date.id, 1);
    expect(testShift.time.id, 1);
    expect(testShift.weather.id, 1);
    expect(testShift.isAttendance, true);
    expect(testShift.createdUserId, 1);
    expect(testShift.updatedUserId, 1);
    expect(testShift.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testShift.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testShift.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('shift.isDeleted', () {
    final Shift shift = Shift();
    expect(shift.isDeleted, false);
    expect(testShift.isDeleted, true);
  });

  test('shift.toJson()', () {
    final Shift initialShift = Shift();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'user': {
        'id': 0,
        'name': '',
        'bureauId': 0,
        'gradeId': 0,
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'task': {
        'id': 0,
        'task': '',
        'color': '0xfffafa',
        'place': '',
        'url': '',
        'superviser': '',
        'notes': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'year': {
        'id': 0,
        'year': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'date': {
        'id': 0,
        'date': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'time': {
        'id': 0,
        'time': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'weather': {
        'id': 0,
        'weather': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'isAttendance': false,
      'createdUserId': 0,
      'updatedUserId': 0,
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(jsonEncode(initialShift), jsonEncode(initialMap));

    const Map<String, dynamic> testMap = {
      'id': 1,
      'user': {
        'id': 1,
        'name': '',
        'bureauId': 0,
        'gradeId': 0,
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'task': {
        'id': 1,
        'task': '',
        'color': '0xfffafa',
        'place': '',
        'url': '',
        'superviser': '',
        'notes': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'year': {
        'id': 1,
        'year': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'date': {
        'id': 1,
        'date': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'time': {
        'id': 1,
        'time': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'weather': {
        'id': 1,
        'weather': '',
        'createdAt': '0000-01-01 00:00:00.000',
        'updatedAt': '0000-01-01 00:00:00.000',
        'isDeleted': false,
      },
      'isAttendance': true,
      'createdUserId': 1,
      'updatedUserId': 1,
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };

    expect(jsonEncode(testShift), jsonEncode(testMap));
  });
}
