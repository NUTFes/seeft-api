import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/export.dart';
import '../../entity/export.dart';
import '../../usecase/bureau_usecase.dart';

class BureauController {
  final StatusResponse statusResponse;
  final BureauUsecase bureauUsecase;

  BureauController(
    this.statusResponse,
    this.bureauUsecase,
  );

  getBureaus(Request request) async {
    try {
      List<Bureau> bureaus = await bureauUsecase.getBureaus(request.context);
      Log.info('bureaus');
      List<Map> list = [];

      for (var bureau in bureaus) {
        list.add(bureau.toMap);
      }

      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
    } catch (e) {
      Log.severe("BureauController.getBureaus: " + e.toString());
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
