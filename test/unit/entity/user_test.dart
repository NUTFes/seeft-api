import 'package:test/test.dart';

import '../../../lib/entity/user.dart';

void main() {
  final User testUser = User(
    id: 1,
    name: 'hoge',
    bureauId: 100,
    gradeId: 4,
    createdAt: '1998/10/23 04:35:22',
    updatedAt: '2002/10/23 06:44:11',
    deletedAt: '2019/01/01 00:00:00',
  );

  test('create user entity', () {
    final User user = User();
    expect(user.id, 0);
    expect(user.name, '');
    expect(user.bureauId, 0);
    expect(user.gradeId, 0);
    expect(user.createdAt, '');
    expect(user.updatedAt, '');
    expect(user.deletedAt, 'null');

    expect(testUser.id, 1);
    expect(testUser.name, 'hoge');
    expect(testUser.bureauId, 100);
    expect(testUser.gradeId, 4);
    expect(testUser.createdAt, '1998/10/23 04:35:22');
    expect(testUser.updatedAt, '2002/10/23 06:44:11');
    expect(testUser.deletedAt, '2019/01/01 00:00:00');
  });

  test('user.isDeleted', () {
    final User user = User();
    expect(user.isDeleted, false);

    expect(testUser.isDeleted, true);
  });

  test('user.toMap', () {
    final User initialUser = User();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'name': '',
      'bureauId': 0,
      'gradeId': 0,
      'createdAt': '',
      'updatedAt': '',
      'isDeleted': false,
    };
    expect(initialUser.toMap, initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'name': 'hoge',
      'bureauId': 100,
      'gradeId': 4,
      'createdAt': '1998/10/23 04:35:22',
      'updatedAt': '2002/10/23 06:44:11',
      'isDeleted': true,
    };
    expect(testUser.toMap, testMap);
  });
}
