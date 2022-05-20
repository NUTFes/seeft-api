import 'package:test/test.dart';

import 'package:seeft_api/entity/time.dart';

void main() {
  final Time testTime = Time(
    id: 1,
    time: 'hoge',
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create time entity', () {
    final Time time = Time();
    expect(time.id, 0);
    expect(time.time, '');
    expect(time.createdAt, DateTime(0));
    expect(time.updatedAt, DateTime(0));
    expect(time.deletedAt, null);

    expect(testTime.id, 1);
    expect(testTime.time, 'hoge');
    expect(testTime.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testTime.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testTime.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('time.isDeleted', () {
    final Time time = Time();
    expect(time.isDeleted, false);
    expect(testTime.isDeleted, true);
  });

  test('time.toJson()', () {
    final Time initialTime = Time();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'time': '',
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialTime.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'time': 'hoge',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testTime.toJson(), testMap);
  });
}
