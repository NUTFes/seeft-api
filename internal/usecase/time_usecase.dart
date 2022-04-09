import '../entity/export.dart';
import './repository/time_repository.dart';

class TimeUsecase {
  TimeRepository timeRepository;

  TimeUsecase(this.timeRepository);

  List<Time> getTimes(ctx) {
    var list = timeRepository.getTimes(ctx);
    
    return list;
  }
}
