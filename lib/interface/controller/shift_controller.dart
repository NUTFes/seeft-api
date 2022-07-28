import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/config.dart';
import '../../entity/entity.dart';
import '../../usecase/usecase.dart';

class ShiftController {
  final StatusResponse statusResponse;
  final ShiftUsecase shiftUsecase;

  ShiftController(
    this.statusResponse,
    this.shiftUsecase,
  );

  Future<Response> getShiftsByUser(Request request, String id) async {
    try {
      Log.info('${request.headers}');
      final req = User(id: int.parse(id));
      final res = await shiftUsecase.getShiftsByUser(request.context, req);
      return statusResponse.responseOK(jsonEncode(res));

/*
      List<Time> times = await timeUsecase.getTimes(request.context);
      return statusResponse.responseOK(jsonEncode(times));
*/
    } catch (e) {
      Log.severe('shiftContoller.getShiftsByUser: ${e.toString()}');
      var json = jsonEncode({'message': e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
