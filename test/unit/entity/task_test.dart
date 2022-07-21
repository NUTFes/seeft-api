import 'package:test/test.dart';

import 'package:seeft_api/entity/entity.dart';

void main() {
  final Task testTask = Task(
    id: 1,
    task: 'hoge',
    color: Color(0x000000),
    place: 'hoge',
    url: 'hoge',
    superviser: 'hoge',
    notes: 'hoge',
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create task entity', () {
    final Task task = Task();
    expect(task.id, 0);
    expect(task.task, '');
    expect(task.color.toString(), Color(0xFFFAFA).toString());
    expect(task.place, '');
    expect(task.url, '');
    expect(task.superviser, '');
    expect(task.notes, '');
    expect(task.createdAt, DateTime(0));
    expect(task.updatedAt, DateTime(0));
    expect(task.deletedAt, null);

    expect(testTask.id, 1);
    expect(testTask.task, 'hoge');
    expect(testTask.color.toString(), Color(0x000000).toString());
    expect(testTask.place, 'hoge');
    expect(testTask.url, 'hoge');
    expect(testTask.superviser, 'hoge');
    expect(testTask.notes, 'hoge');
    expect(testTask.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testTask.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testTask.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('task.isDeleted', () {
    final Task task = Task();
    expect(task.isDeleted, false);
    expect(testTask.isDeleted, true);
  });

  test('task.toJson()', () {
    final Task initialTask = Task();
    const Map<String, dynamic> initialMap = {
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
    };
    expect(initialTask.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'task': 'hoge',
      'color': '0x000000',
      'place': 'hoge',
      'url': 'hoge',
      'superviser': 'hoge',
      'notes': 'hoge',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testTask.toJson(), testMap);
  });
}
