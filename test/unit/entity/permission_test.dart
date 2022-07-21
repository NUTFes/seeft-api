import 'package:test/test.dart';

import 'package:seeft_api/entity/permission.dart';

void main() {
  final Permission testPermission = Permission(
    id: 1,
    allowShift: true,
    allowTask: true,
    allowUser: true,
    allowProperty: true,
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create permission entity', () {
    final Permission permission = Permission();
    expect(permission.id, 0);
    expect(permission.allowShift, false);
    expect(permission.allowTask, false);
    expect(permission.allowUser, false);
    expect(permission.allowProperty, false);
    expect(permission.createdAt, DateTime(0));
    expect(permission.updatedAt, DateTime(0));
    expect(permission.deletedAt, null);

    expect(testPermission.id, 1);
    expect(testPermission.allowShift, true);
    expect(testPermission.allowTask, true);
    expect(testPermission.allowUser, true);
    expect(testPermission.allowProperty, true);
    expect(testPermission.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testPermission.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testPermission.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('permission.isDeleted', () {
    final Permission permission = Permission();
    expect(permission.isDeleted, false);
    expect(testPermission.isDeleted, true);
  });

  test('permission.toJson()', () {
    final Permission initialPermission = Permission();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'allowShift': false,
      'allowTask': false,
      'allowUser': false,
      'allowProperty': false,
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialPermission.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'allowShift': true,
      'allowTask': true,
      'allowUser': true,
      'allowProperty': true,
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testPermission.toJson(), testMap);
  });
}
