import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class TimeApi {
  var controller;

  TimeApi(this.controller);

  Router get router {
    final router = Router();

    router.get('/', controller.getTimes);

    return router;
  }
}
