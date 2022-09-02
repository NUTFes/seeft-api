import '../../usecase/repository/task_repository.dart';
import '../../entity/entity.dart';
import './external/database.dart';

class TaskRepositoryImpl implements TaskRepository {
  Database database;

  TaskRepositoryImpl(this.database);

  @override
  Future<List<Task>> getTasks(ctx) async {
    String sql = '''
SELECT * FROM tasks;
''';

    List<Map<String, dynamic>> data = await database.finds(ctx, sql);
    List<Task> list = [];

    for (var d in data) {
      Task task = Task(
        id: d['id'],
        task: d['task'],
        color: Color(int.parse(d['color'], radix: 16)),
        place: d['place'],
        url: d['url'],
        superviser: d['superviser'],
        notes: d['notes'].toString(),
        yearId: d['year_id'],
        createdAt: d['created_at'],
        updatedAt: d['updated_at'],
        deletedAt: d['deleted_at'],
      );

      if (task.isDeleted) {
        continue;
      }

      list.add(task);
    }

    return list;
  }
}
