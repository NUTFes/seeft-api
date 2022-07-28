import '../../entity/entity.dart';

abstract class ShiftRepository {
  Future<List<Shift>> getShiftsByUser(ctx, User req);
}
