import '../../entity/export.dart';

abstract class TimeRepository {
  List<Time> getTimes(ctx);
}
