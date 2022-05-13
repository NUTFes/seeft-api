import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BureauApi {
  var controller;

  BureauApi(this.controller);

  Router get router {
    final router = Router();

    router.get('/', controller.getBureaus);
//    router.get('/<id>', controller.getBureau);

    return router;
  }
}
