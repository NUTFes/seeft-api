import '../entity/entity.dart';
import './repository/repository.dart';

abstract class ShiftUsecase {
  Future<List<Shift>> getShiftsByUser(ctx, User req);
}

class ShiftUsecaseImpl implements ShiftUsecase {
  ShiftRepository shiftRepository;

  ShiftUsecaseImpl(this.shiftRepository);

  @override
  Future<List<Shift>> getShiftsByUser(ctx, User req) async {
    List<Shift> list = await shiftRepository.getShiftsByUser(ctx, req);

    return list;
  }
}
