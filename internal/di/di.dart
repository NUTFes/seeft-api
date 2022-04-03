import '../external/server/server.dart';
import '../external/server/router.dart';
import '../external/mysql/mysql.dart';
import '../interface/controller/health_controller.dart';
import '../interface/controller/user_controller.dart';
import '../interface/controller/session_controller.dart';
import '../interface/repository/user_repository.dart';
import '../interface/repository/session_repository.dart';
import '../usecase/user_usecase.dart';
import '../usecase/session_usecase.dart';
import '../config/http_status.dart';

initializeServer() async{
  final statusResponse = StatusResponse();
  final database = Mysql();
  await database.connect();

  final userRepository = UserRepositoryImpl(database);
  final sessionRepository = SessionRepositoryImpl(database);

  final userUsecase = UserUsecase(userRepository, sessionRepository);
  final sessionUsecase = SessionUsecase(sessionRepository);

  final healthController = HealthController();
  final userController = UserController(statusResponse, userUsecase);
  final sessionController = SessionController(statusResponse, sessionUsecase);

  final service = Service(healthController, userController, sessionController);
  final server = Server(service);

  return server;
}
