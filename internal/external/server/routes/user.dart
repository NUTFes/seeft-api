import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserApi {
  var controller;

  UserApi(this.controller);

  Router get router {
    final router = Router();
    print("user router's controller is ${controller.runtimeType}");

    router.get('/', controller.getUsers);
    router.get('/<id>', controller.getUser);
    router.post('/', controller.insertUser);
    router.put('/', controller.updateUser);
    router.delete('/<id>', controller.deleteUser);

    return router;
  }
}
