import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class SessionController {
  var statusResponse;
  var sessionUsecase;

  SessionController(this.statusResponse, this.sessionUsecase);
  
  getSession(Request request, String id) async{
    try {
      Session session = await sessionUsecase.getSession(
        request.context,
        int.parse(id)
      );
      var json = jsonEncode(session.toMap);
      return statusResponse.responseOK(json);
      
    } on Exception catch(e, st) {
      print(e);
      //      print(st);
      print(e.runtimeType);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    } on Error catch(e, st) {
      print(e.runtimeType);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);

    }
  }

  getSessions(Request request) async{
    try {
      List<Session> sessions = await sessionUsecase.getSessions(request.context);

      List<Map> list = [];
      sessions.forEach((session) {
          list.add(session.toMap);
      });
      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
      
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      //      print(st);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }


  insertSession(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['title'] == null) {
        throw Exception('title params does not exist');
      }

      if (params['description'] == null) {
        throw Exception('description params does not exist');
      }

      if (params['user_id'] == null) {
        throw Exception('user_id params does not exist');
      }

      Session req = Session(
        0,
        params['title'],
        params['description'],
        params['user_id'],
      );

      Session session = await sessionUsecase.insertSession(
        request.context,
        req
      );

      var json = jsonEncode(session.toMap);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});      
      return statusResponse.responseBadRequest(json);
    }
  }

  updateSession(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['id'] == null) {
        throw Exception('id params does not exist');
      }
      
      if (params['title'] == null) {
        throw Exception('title params does not exist');
      }

      if (params['description'] == null) {
        throw Exception('description params does not exitst.');
      }

      if (params['user_id'] == null) {
        throw Exception('user_id params dows not exist.');
      }

      Session req = Session(
        params['id'],
        params['title'],
        params['description'],
        params['user_id'],
      );

      Session session = await sessionUsecase.updateSession(
        request.context,
        req
      );

      String json = jsonEncode(session.toMap);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }

  deleteSession(Request request, String id) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      Session session = await sessionUsecase.deleteSession(
        request.context,
        Session(
          int.parse(id),
          "",
          "",
          0
        )
      );

      Map map = {'success': session.isDeleted};
      String json = jsonEncode(map);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }

}
