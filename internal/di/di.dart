import '../external/server/server.dart';
import '../external/server/router.dart';
import '../external/mysql/mysql.dart';
import '../interface/controller/health_controller.dart';
import '../interface/controller/user_controller.dart';
import '../interface/controller/time_controller.dart';
import '../interface/controller/bureau_controller.dart';
import '../interface/repository/user_repository.dart';
import '../interface/repository/time_repository.dart';
import '../interface/repository/bureau_repository.dart';
import '../usecase/user_usecase.dart';
import '../usecase/time_usecase.dart';
import '../usecase/bureau_usecase.dart';
import '../config/http_status.dart';

initializeServer() async {
  final statusResponse = StatusResponse();
  final database = Mysql();
  await database.connect();

  final userRepository = UserRepositoryImpl(database);
  final timeRepositoty = TimeRepositoryImpl(database);
  final bureauRepository = BureauRepositoryImpl(database);

  final userUsecase = UserUsecase(userRepository);
  final timeUsecase = TimeUsecase(timeRepositoty);
  final bureauUsecase = BureauUsecase(bureauRepository);

  final healthController = HealthController();
  final userController = UserController(statusResponse, userUsecase);
  final timeController = TimeController(statusResponse, timeUsecase);
  final bureauController = BureauController(statusResponse, bureauUsecase);

  final service = Service(
    healthController,
    userController,
    timeController,
    bureauController,
  );
  final server = Server(service);

  return server;
}
