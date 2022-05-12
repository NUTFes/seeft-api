import '../../entity/export.dart';

abstract class BureauRepository {
  Future<List<Bureau>> getBureaus(ctx);
}
