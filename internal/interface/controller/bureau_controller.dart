import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/logger.dart';
import '../../entity/export.dart';

class BureauController {
  var statusResponse;
  var bureauUsecase;

  BureauController(
    this.statusResponse,
    this.bureauUsecase,
  );

  getBureaus(Request request) {
    try {
      List<Bureau> bureaus = bureauUsecase.getBureaus(request.context);
      Log.info('bureaus');
      List<Map> list = [];
      bureaus.forEach((bureau) {
        list.add(bureau.toMap);
      });

      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
    } catch (e, st) {
      Log.severe("BureauController.getBureaus: " + e.toString());
      print(e);
      //      print(st);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
