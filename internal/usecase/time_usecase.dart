import '../entity/export.dart';
import './repository/time_repository.dart';

class TimeUsecase {
  TimeRepository timeRepository;

  TimeUsecase(this.timeRepository);

  Future<List<Time>> getTimes(ctx) async {
    List<Time> list = await timeRepository.getTimes(ctx);

    return list;
  }
}
