import '../../entity/entity.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks(ctx);
}
