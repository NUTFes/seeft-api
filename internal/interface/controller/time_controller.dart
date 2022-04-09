import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class TimeController {
  var statusResponse;

  TimeController(this.statusResponse);

  getTimes(Request request) async {
    try {
/*      List<User> users = await userUsecase.getUsers(request.context);

      List<Map> list = [];
      users.forEach((user) {
        list.add(user.toMap);
      });
          */

      List<Map> list = [];
      var time = Time(0, '1:00');
      list.add(time.toMap);    
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
