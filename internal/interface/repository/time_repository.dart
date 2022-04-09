import '../../usecase/repository/time_repository.dart';
import '../../entity/export.dart';

class TimeRepositoryImpl implements TimeRepository{

  TimeRepositoryImpl();

  List<Time> getTimes(ctx) {
    List<Time> list = [];
    var time = Time(0, '1:00');
    list.add(time);
    list.add(time);
    

    return list;
  }
}
