import '../external/server/server.dart';
import '../external/server/router.dart';
import '../external/mysql/mysql.dart';
import '../interface/controller/health_controller.dart';
import '../interface/controller/user_controller.dart';
import '../interface/repository/user_repository.dart';
import '../usecase/user_usecase.dart';
import '../config/http_status.dart';

initializeServer() async {
  final statusResponse = StatusResponse();
/*  final database = Mysql();
  await database.connect();

  final userRepository = UserRepositoryImpl(database);

  final userUsecase = UserUsecase(userRepository);

  final healthController = HealthController();
  final userController = UserController(statusResponse, userUsecase);

  final service = Service(healthController, userController);
  */
  final healthController = HealthController();
  final service = Service(healthController);
  final server = Server(service);

  return server;
}
