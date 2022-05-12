import '../../entity/export.dart';

abstract class TimeRepository {
  Future<List<Time>> getTimes(ctx);
}
