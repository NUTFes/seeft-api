import 'package:test/test.dart';

import 'package:seeft_api/entity/grade.dart';

void main() {
  final Grade testGrade = Grade(
    id: 1,
    grade: 'hoge',
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create grade entity', () {
    final Grade grade = Grade();
    expect(grade.id, 0);
    expect(grade.grade, '');
    expect(grade.createdAt, DateTime(0));
    expect(grade.updatedAt, DateTime(0));
    expect(grade.deletedAt, null);

    expect(testGrade.id, 1);
    expect(testGrade.grade, 'hoge');
    expect(testGrade.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testGrade.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testGrade.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('grade.isDeleted', () {
    final Grade grade = Grade();
    expect(grade.isDeleted, false);
    expect(testGrade.isDeleted, true);
  });

  test('grade.toJson()', () {
    final Grade initialGrade = Grade();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'grade': '',
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialGrade.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'grade': 'hoge',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testGrade.toJson(), testMap);
  });
}
