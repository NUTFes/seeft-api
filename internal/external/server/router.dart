import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'routes/export.dart';
import '../../interface/controller/health_controller.dart';

class Service {
  var healthController;
//  var userController;

  Service(
    this.healthController,
//    this.userController,
  );

  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok('Get request');
    });

    router.get('/healthz', healthController.getHealth);

    router.mount('/api', Api().router);

//    router.mount('/user', UserApi(userController).router);

    router.all('/<ignored|.*>', (Request request) {
        return Response.notFound('Page not found');
    });
    
    return router;
  }
}
