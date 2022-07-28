import 'package:shelf_router/shelf_router.dart';
import '../../../interface/controller/controller.dart';

class ShiftApi {
  final ShiftController controller;

  ShiftApi(this.controller);

  Router get router {
    final router = Router();

//    router.get('/', controller.getShifts)
    router.get('/users/<id>', controller.getShiftsByUser);
//    router.post('/', controller.insertShifts);

    return router;
  }
}
