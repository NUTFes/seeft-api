import '../../usecase/repository/shift_repository.dart';
import '../../entity/entity.dart';
import './external/database.dart';

class ShiftRepositoryImpl implements ShiftRepository {
  Database database;

  ShiftRepositoryImpl(this.database);

  @override
  Future<List<Shift>> getShiftsByUser(ctx, User req) async {
    String sql = '''
SELECT * FROM shifts;
''';

    List<Map<String, dynamic>> data = await database.finds(ctx, sql);
    List<Shift> list = [];

    for (var d in data) {
      Shift shift = Shift(
        id: d['id'],
        createdAt: d['created_at'],
        updatedAt: d['updated_at'],
        deletedAt: d['deleted_at'],
      );

      if (shift.isDeleted) {
        continue;
      }

      list.add(shift);
    }

    return list;
  }
}
