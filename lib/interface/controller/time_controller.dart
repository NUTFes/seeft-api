import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class TimeController {
  var statusResponse;
  var timeUsecase;

  TimeController(
    this.statusResponse,
    this.timeUsecase,
  );

  getTimes(Request request) async {
    try {
      List<Time> times = await timeUsecase.getTimes(request.context);

      List<Map> list = [];
      times.forEach((time) {
        list.add(time.toMap);
      });

      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
    } catch (e, st) {
      print(e);
      //      print(st);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
