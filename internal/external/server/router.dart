import 'dart:async' show Future;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'routes/export.dart';
import '../../interface/controller/health_controller.dart';

class Service {
  var healthController;
  var userController;
  var sessionController;

  Service(
    this.healthController,
    this.userController,
    this.sessionController
  );

  Handler get handler {
    final router = Router();

    print(userController.runtimeType);
    router.get('/', (Request request) {
        return Response.ok('Get request');
    });

    router.get('/healthz', healthController.getHealth);

    router.mount('/api', Api().router);

    router.mount('/user', UserApi(userController).router);

    router.mount('/session', SessionApi(sessionController).router);

    return router;
  }
}
