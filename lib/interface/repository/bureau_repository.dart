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

    List<Map<String, dynamic>> data = await database.finds(ctx, sql);
    List<Bureau> list = [];

    data.forEach((d) {
      Bureau bureau = Bureau(
        id: d['id'],
        bureau: d['bureau'],
        color: Color(int.parse(d['color'], radix: 16)),
        createdAt: d['created_at'].toString(),
        updatedAt: d['updated_at'].toString(),
        deletedAt: d['deleted_at'].toString(),
      );

      if (!bureau.isDeleted) {
        list.add(bureau);
      }
    });

    return list;
  }
}
