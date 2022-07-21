import 'package:test/test.dart';

import 'package:seeft_api/entity/entity.dart';

void main() {
  final Shift testShift = Shift(
    id: 1,
    userId: 1,
    taskId: 1,
    yearId: 1,
    dateId: 1,
    timeId: 1,
    weatherId: 1,
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
    expect(shift.userId, 0);
    expect(shift.taskId, 0);
    expect(shift.yearId, 0);
    expect(shift.dateId, 0);
    expect(shift.timeId, 0);
    expect(shift.weatherId, 0);
    expect(shift.isAttendance, false);
    expect(shift.createdUserId, 0);
    expect(shift.updatedUserId, 0);
    expect(shift.createdAt, DateTime(0));
    expect(shift.updatedAt, DateTime(0));
    expect(shift.deletedAt, null);

    expect(testShift.id, 1);
    expect(testShift.userId, 1);
    expect(testShift.taskId, 1);
    expect(testShift.yearId, 1);
    expect(testShift.dateId, 1);
    expect(testShift.timeId, 1);
    expect(testShift.weatherId, 1);
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
      'userId': 0,
      'taskId': 0,
      'yearId': 0,
      'dateId': 0,
      'timeId': 0,
      'weatherId': 0,
      'isAttendance': false,
      'createdUserId': 0,
      'updatedUserId': 0,
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialShift.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'userId': 1,
      'taskId': 1,
      'yearId': 1,
      'dateId': 1,
      'timeId': 1,
      'weatherId': 1,
      'isAttendance': true,
      'createdUserId': 1,
      'updatedUserId': 1,
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testShift.toJson(), testMap);
  });
}
