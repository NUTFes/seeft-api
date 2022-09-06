import '../entity/entity.dart';
import './repository/repository.dart';

abstract class TaskUsecase {
  Future<List<Task>> getTasks(ctx);
}

class TaskUsecaseImpl implements TaskUsecase {
  TaskRepository taskRepository;

  TaskUsecaseImpl(this.taskRepository);

  @override
  Future<List<Task>> getTasks(ctx) async {
    List<Task> list = await taskRepository.getTasks(ctx);

    return list;
  }
}
