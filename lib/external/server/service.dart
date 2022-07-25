import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

import 'routes/route.dart';
import '../../interface/controller/controller.dart';

class Service {
  final HealthController healthController;
  final UserController userController;
  final TimeController timeController;
  final BureauController bureauController;
  final ShiftController shiftController;

  Service(
    this.healthController,
    this.userController,
    this.timeController,
    this.bureauController,
    this.shiftController,
  );

  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok('Get request');
    });

    router.get('/healthz', healthController.getHealth);

    router.mount('/users', UserApi(userController).router);

    router.mount('/times', TimeApi(timeController).router);

    router.mount('/bureaus', BureauApi(bureauController).router);

    router.mount('/shifts', ShiftApi(shiftController).router);

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}
