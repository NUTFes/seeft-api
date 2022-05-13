import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/export.dart';
import '../../entity/export.dart';
import '../../usecase/time_usecase.dart';

class TimeController {
  final StatusResponse statusResponse;
  final TimeUsecase timeUsecase;

  TimeController(
    this.statusResponse,
    this.timeUsecase,
  );

  getTimes(Request request) async {
    try {
      List<Time> times = await timeUsecase.getTimes(request.context);

      List<Map> list = [];
      for (var time in times) {
        list.add(time.toMap);
      }

      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
    } catch (e) {
      Log.severe('timeContoller.getTimes: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
