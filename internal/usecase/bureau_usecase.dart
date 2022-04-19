import '../config/logger.dart';
import '../entity/export.dart';
import './repository/bureau_repository.dart';

class BureauUsecase {
  BureauRepository bureauRepository;

  BureauUsecase(this.bureauRepository);

  Future<List<Bureau>> getBureaus(ctx) async {
    List<Bureau> list = await bureauRepository.getBureaus(ctx);

    return list;
  }
}
