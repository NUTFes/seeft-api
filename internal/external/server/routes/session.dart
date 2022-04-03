import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class SessionApi {
  var controller;

  SessionApi(this.controller);

    Router get router {
    final router = Router();
    print("user router's controller is ${controller.runtimeType}");

    router.get('/', controller.getSessions);
    router.get('/<id>', controller.getSession);
    router.post('/', controller.insertSession);
    router.put('/', controller.updateSession);
    router.delete('/<id>', controller.deleteSession);

    return router;
  }
}

