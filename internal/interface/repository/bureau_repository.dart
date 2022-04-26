import '../../usecase/repository/bureau_repository.dart';
import '../../entity/export.dart';
import './external/database.dart';

class BureauRepositoryImpl implements BureauRepository {
  Database database;

  BureauRepositoryImpl(this.database);

  Future<List<Bureau>> getBureaus(ctx) async {
    String sql = '''
SELECT * FROM bureaus;
''';

    List<Map<String, dynamic>> data = await database.select(ctx, sql);
    List<Bureau> list = [];

    data.forEach((d) {
      Bureau bureau = Bureau(
        d['id'],
        d['bureau'],
        Color(int.parse(d['color'], radix: 16)),
        d['created_at'].toString(),
        d['updated_at'].toString(),
        d['deleted_at'].toString(),
      );

      if (!bureau.isDeleted) {
        list.add(bureau);
      }
    });

    return list;
  }
}
