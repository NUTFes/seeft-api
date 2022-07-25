import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/config.dart';
import '../../entity/entity.dart';
import '../../usecase/usecase.dart';

class ShiftController {
  final StatusResponse statusResponse;
//  final TimeUsecase timeUsecase;

  ShiftController(
    this.statusResponse,
//    this.timeUsecase,
  );

  Future<Response> getShiftsByUser(Request request, String id) async {
    try {
      Log.info('${request.headers}');
      return Response.ok('response ok.}');
/*
      List<Time> times = await timeUsecase.getTimes(request.context);
      return statusResponse.responseOK(jsonEncode(times));
*/
    } catch (e) {
      Log.severe('timeContoller.getTimes: ${e.toString()}');
      var json = jsonEncode({'message': e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
