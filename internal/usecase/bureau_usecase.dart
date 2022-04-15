import '../config/logger.dart';
import '../entity/export.dart';
//import './repository/bureau_repository.dart';

class BureauUsecase {
//  BureauRepository bureauRepository;

//  BureauUsecase(this.bureauRepository);
  BureauUsecase();

  List<Bureau> getBureaus(ctx) {
//    List<Time> list = await timeRepository.getTimes(ctx);
    Bureau bureau = Bureau(0, 'bureau', '#000000');
    List<Bureau> list = [];
    list.add(bureau);

    Log.info(bureau);

    return list;
  }
}
