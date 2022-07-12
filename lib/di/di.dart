import '../external/server/server.dart';
import '../external/server/service.dart';
import '../external/mysql/mysql.dart';
import '../interface/controller/controller.dart';
import '../interface/repository/repository.dart';
import '../usecase/usecase.dart';
import '../config/config.dart';

initializeServer() async {
  final environment = Environment();
  print(environment.applicationEnv);
  final statusResponse = StatusResponse();
  final conn = await Mysql.connect();
  final database = Mysql(conn);

  final userRepository = UserRepositoryImpl(database);
  final timeRepositoty = TimeRepositoryImpl(database);
  final bureauRepository = BureauRepositoryImpl(database);

  final userUsecase = UserUsecaseImpl(userRepository);
  final timeUsecase = TimeUsecaseImpl(timeRepositoty);
  final bureauUsecase = BureauUsecaseImpl(bureauRepository);

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
