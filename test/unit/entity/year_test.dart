import 'package:test/test.dart';

import 'package:seeft_api/entity/year.dart';

void main() {
  final Year testYear = Year(
    id: 1,
    year: 2222,
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create year entity', () {
    final Year year = Year();
    expect(year.id, 0);
    expect(year.year, 0);
    expect(year.createdAt, DateTime(0));
    expect(year.updatedAt, DateTime(0));
    expect(year.deletedAt, null);

    expect(testYear.id, 1);
    expect(testYear.year, 2222);
    expect(testYear.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testYear.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testYear.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('year.isDeleted', () {
    final Year year = Year();
    expect(year.isDeleted, false);
    expect(testYear.isDeleted, true);
  });

  test('year.toJson()', () {
    final Year initialYear = Year();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'year': 0,
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialYear.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'year': 2222,
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testYear.toJson(), testMap);
  });
}
