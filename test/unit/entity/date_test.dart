import 'package:test/test.dart';

import 'package:seeft_api/entity/date.dart';

void main() {
  final Date testDate = Date(
    id: 1,
    date: 'hoge',
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create date entity', () {
    final Date date = Date();
    expect(date.id, 0);
    expect(date.date, '');
    expect(date.createdAt, DateTime(0));
    expect(date.updatedAt, DateTime(0));
    expect(date.deletedAt, null);

    expect(testDate.id, 1);
    expect(testDate.date, 'hoge');
    expect(testDate.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testDate.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testDate.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('date.isDeleted', () {
    final Date date = Date();
    expect(date.isDeleted, false);
    expect(testDate.isDeleted, true);
  });

  test('date.toJson()', () {
    final Date initialDate = Date();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'date': '',
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialDate.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'date': 'hoge',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testDate.toJson(), testMap);
  });
}
