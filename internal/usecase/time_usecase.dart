import '../entity/export.dart';
//import './repository/time_repository.dart';

class TimeUsecase {
//  UserRepository userRepository;

  TimeUsecase();

  List<Time> getTimes(ctx) {
    List<Time> list = [];
    var time = Time(0, '1:00');
    list.add(time);    

    return list;
  }
}
