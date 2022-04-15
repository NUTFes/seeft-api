import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class BureauController {
  var statusResponse;
//  var timeUsecase;

  BureauController(
    this.statusResponse,
//    this.timeUsecase,
  );

  getBureaus(Request request) {
    try {
/*      List<Time> bureaus = [];

      List<Map> list = [];
      times.forEach((time) {
        list.add(time.toMap);
      });
          */

      final bureau = Bureau(0, 'bureau', '#000000');
      List<Map> list = [];
      list.add(bureau.toMap);
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
