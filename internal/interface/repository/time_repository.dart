import '../../usecase/repository/time_repository.dart';
import '../../entity/export.dart';
import './external/database.dart';

class TimeRepositoryImpl implements TimeRepository {
  Database database;

  TimeRepositoryImpl(this.database);

  Future<List<Time>> getTimes(ctx) async {
    String sql = '''
SELECT * FROM times;
''';

    List<Map<String, dynamic>> data = await database.select(ctx, sql);
    List<Time> list = [];

    data.forEach((d) {
      Time user = Time(
        d['id'],
        d['time'],
        d['created_at'].toString(),
        d['updated_at'].toString(),
        d['deleted_at'].toString(),
      );

      if (!user.isDeleted) {
        list.add(user);
      }
    });

    return list;
  }
}
